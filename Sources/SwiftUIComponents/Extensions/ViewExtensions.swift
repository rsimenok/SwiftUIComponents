//
//  ViewExtensions.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 2/8/21.
//

import SwiftUI

public extension View {
    func configure(_ configuration: @escaping (Self) -> Void) -> Self {
        configuration(self)
        return self
    }
}

public extension View {
    func rainbowAnimation() -> some View {
        self.modifier(RainbowAnimation())
    }
}

public struct RainbowAnimation: ViewModifier {
    // 1
    @State var isOn: Bool = false
    let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    // 2
    var duration: Double = 4
    var animation: Animation {
        Animation
            .linear(duration: duration)
            .repeatForever(autoreverses: false)
    }
    
    public func body(content: Content) -> some View {
        // 3
        let gradient = LinearGradient(gradient: Gradient(colors: hueColors+hueColors), startPoint: .leading, endPoint: .trailing)
        return content.overlay(GeometryReader { proxy in
            ZStack {
                gradient
                    // 4
                    .frame(width: 2*proxy.size.width)
                    // 5
                    .offset(x: self.isOn ? -proxy.size.width/2 : proxy.size.width/2)
            }
        })
        // 6
        .onAppear {
            withAnimation(self.animation) {
                self.isOn = true
            }
        }
        .mask(content)
    }
}

public struct FadeModifier: AnimatableModifier {
    // To trigger the animation as well as to hold its final state
    private let control: Bool
    
    // SwiftUI gradually varies it from old value to the new value
    public var animatableData: Double = 0.0
    
    // Re-created every time the control argument changes
    init(control: Bool) {
        // Set control to the new value
        self.control = control
        
        // Set animatableData to the new value. But SwiftUI again directly
        // and gradually varies it from 0 to 1 or 1 to 0, while the body
        // is being called to animate. Following line serves the purpose of
        // associating the extenal control argument with the animatableData.
        self.animatableData = control ? 1.0 : 0.0
    }
    
    // Called after each gradual change in animatableData to allow the
    // modifier to animate
    public func body(content: Content) -> some View {
        // content is the view on which .modifier is applied
        content
            // Map each "0 to 1" and "1 to 0" change to a "0 to 1" change
            .opacity(control ? animatableData : 1.0 - animatableData)
            
            // This modifier is animating the opacity by gradually setting
            // incremental values. We don't want the system also to
            // implicitly animate it each time we set it. It will also cancel
            // out other implicit animations now present on the content.
            .animation(nil)
    }
}

public extension View {
    
    func animatableFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}

public struct AnimatableCustomFontModifier: AnimatableModifier {
    
    var name: String
    var size: CGFloat
    
    public var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

// MARK: - AnimatableSystemFontModifier

public extension View {
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

public struct AnimatableSystemFontModifier: AnimatableModifier {
    public var size: CGFloat
    public var weight: Font.Weight
    public var design: Font.Design
    
    public var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

public extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

public extension View {
    func animate(using animation: Animation = Animation.easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        return onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

public extension View {
    func animateForever(using animation: Animation = Animation.easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)
        
        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}


public struct PopUp<PopUpContent: View>: ViewModifier {
    
    @Binding private var isPresented: Bool
    let popUpContent: () -> PopUpContent
    let onDismiss: (() -> Void)?
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                popUpContent()
                    .onDisappear {
                        onDismiss?()
                    }
                    .padding()
                    .background(
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(15)
                        
                        , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .shadow(radius: 10)
            }
        }
        
    }
    
    public init(isPresented: Binding<Bool>,
                onDismiss: (() -> Void)? = nil,
                @ViewBuilder popUpContent: @escaping () -> PopUpContent) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.popUpContent = popUpContent
    }
}

public extension View {
    
    func popUp<Content>(isPresented: Binding<Bool>,
                        onDismiss: (() -> Void)? = nil,
                        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        self.modifier(PopUp(isPresented: isPresented, onDismiss: onDismiss, popUpContent: content))
    }
}

public struct Reflection: ViewModifier {
    
    var direction: ReflectDirection
    var rotation: Angle {
        switch direction {
        case .bottom: return .degrees(180)
        case .top: return .degrees(0)
        }
    }
    var gradientColors:[Color] {
        switch direction {
        case .bottom: return [.clear, Color.white.opacity(0.2)]
        case .top: return [Color.white.opacity(0.2), .clear]
        }
    }
    
    public func body(content: Content) -> some View {
            ZStack {
                content
                GeometryReader { geometry in
                content
                    .mask(
                        LinearGradient(
                            gradient:  Gradient(colors: gradientColors),
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .offset(getOffset(geometry: geometry))
                    .rotationEffect(rotation)
            }
        }
    }
    
    func getOffset(geometry: GeometryProxy) -> CGSize {
        switch direction {
        case .bottom:
            return CGSize(width: 0, height: geometry.size.height)
        case .top:
            return CGSize(width: 0, height: geometry.size.height)
        }
    }
}

public enum ReflectDirection {
    case bottom
    case top
}

public extension View {
    
    func reflect(direction: ReflectDirection = .top) -> some View {
        self.modifier(Reflection(direction: direction))
    }
}
