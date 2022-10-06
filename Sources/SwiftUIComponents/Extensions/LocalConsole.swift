//
//  LocalConsole.swift
//  
//
//  Created by Moi Gutierrez on 10/4/22.
//

import SwiftUI

import CloudyLogs

public extension View {
    
    func localConsole(presented: Bool) -> some View {
        self.modifier(LocalConsole(presented: presented))
    }
}


struct LocalConsole: ViewModifier {
    
    var presented: Bool
        
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    
    @GestureState private var startLocation: CGPoint? = nil // 1
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 5.0)
        
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onChanged({ value in
                withAnimation {
//                    allowDragging = true
                }
            })
            .onEnded { value in
                withAnimation {
//                    allowDragging = false
                }
            }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location // 3
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                self.location = newLocation
                
                withAnimation {
                    isMoving = true
                }
                
            }.updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location // 2
            }
            .onEnded { value in
                withAnimation {
                    isMoving = false
                }
            }
    }
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { amount in
                
                magnificationCurrentAmount = amount - 1
                
            }
            .onEnded { amount in
                
                if amount > minMagnificationAmount {
                    
                    magnificationFinalAmount += magnificationCurrentAmount
                    magnificationCurrentAmount = 0
                }
                
                withAnimation {
                    isMoving = false
                }
            }
    }
    
//    var resize: some Gesture {
//        DragGesture()
//
//            .onChanged { value in
//
//                if width + value.location.x >= minWidth {
//                    //                                            width += value.translation.width
//                    width = width + value.location.x
//                }
//
//                if height + value.location.y >= minHeight {
//                    //                                            height += value.translation.height
//                    height = height + value.location.y
//                }
//
//                withAnimation {
//                    //
//                    //                                        if width >= minWidth {
//                    //                                            //                                            width += value.translation.width
//                    //                                            width = width + value.location.x
//                    //                                        }
//                    //
//                    //                                        if height >= minHeight {
//                    //                                            //                                            height += value.translation.height
//                    //                                            height = height + value.location.y
//                    //                                        }
//                    //
//                    isMoving = true
//                }
//            }
//            .onEnded { _ in
//                withAnimation {
//                    isMoving = false
//                }
//            }
//    }
    
    // frame
    let scaling = 0.5
    var minWidth:CGFloat { 176.0 / scaling }
    var minHeight:CGFloat { 88.0 / scaling }
    @State private var width = 10.0
    @State private var height = 10.0
    let shrinkMultiplier = 0.8
    
    //
    @State private var isMoving = false
    @State private var allowDragging = false
    
    @State private var isHidden = false
    @State var opacity: Double = 1.0
    
    @GestureState var isDetectingLongPress = false
    
    //
    @State private var magnificationCurrentAmount = 0.0
    @State private var magnificationFinalAmount = 1.0
    let minMagnificationAmount = 0.4
    
    enum Filters: String, CaseIterable {
        case error
        case info
        case warning
    }
    
    @State var filterText: String = ""
    
    public init(presented: Bool) {
        self.presented = presented
    }
    
    public func body(content: Content) -> some View {
        
        ZStack {
            
            content
            
            if presented {
                
                GeometryReader { geometry in
                    
                    ZStack {
                        
                        Group {
                            
                            Rectangle()
//                                .fill(allowDragging ? isMoving ? .purple:.blue :.green)
                                .fill(.green)
//                                .opacity(isMoving ? 0.1:0.25)
//                                .fill(allowDragging ? isMoving ? .purple:.green :.blue)
                                .shadow(color: allowDragging ? .green:.blue, radius: allowDragging ? 40:5)
                            
                            Rectangle()
                                .blur(radius: 20)

                        }
                        .opacity(isHidden ? 0.0:1.0)
                        .opacity(isMoving ? 0.1:0.25)
                        .cornerRadius(25)

                        NavigationView {
                            
                            FilteredList(
                                list: Logger.orderedLogs,
                                filterText: $filterText) { (string) in
                                    
                                    Text("\(string)")
                                        .font(.system(size: 8))
                                }
                            
                                .listStyle(GroupedListStyle())
                                .navigationViewStyle(StackNavigationViewStyle())
                                .navigationBarHidden(true)
                                .cornerRadius(25)
                        }
                        .padding()
                        .opacity(isMoving ? 0.5:1.0)
                        .minimumScaleFactor(0.2)
                        .opacity(isHidden ? 0.0:1.0)
                        .cornerRadius(25)

                        buttons()
                        
                    }
                    .position(location)
                    .frame(width: width, height: height)
                    .onAppear {
                        width = max(geometry.size.width * 0.9, minWidth)
                        height = max(geometry.size.height * 0.9 / 3, minHeight)
                        location = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                    .scaleEffect(magnificationFinalAmount + magnificationCurrentAmount)
                    .opacity(opacity)
                }
                .gesture(drag.simultaneously(with: magnification))
            }
        }
        
    }
    
    @ViewBuilder
    func buttons() -> some View {
        
        HStack {
            
            Spacer()
            
            VStack {
                
                Spacer()
                
                Menu {
                    
                    Button {
                        withAnimation {
                            isHidden.toggle()
                        }
                    } label: {
                        Text("\(isHidden ? "un-hide":"hide")")
                        Image(systemName: isHidden ? "eye.slash": "eye")
                    }
                    
                    Menu("filters") {
                        
//                        Filters.allCases.forEach { filter in
//                            Button {
//                                withAnimation {
//                                    isHidden.toggle()
//                                }
//                            } label: {
//                                Text("\(isHidden ? "un-hide":"hide")")
//                                Image(systemName: isHidden ? "eye.slash": "eye")
//                            }
//                        }
                        
                        Button {
                            filterText = Logger.LogType.error.rawValue
                        } label: {
                            Text("\(Logger.LogType.error.rawValue)")
                        }
                        
                        Button {
                            filterText = Logger.LogType.warning.rawValue
                        } label: {
                            Text("\(Logger.LogType.warning.rawValue)")
                        }
                    }
                    
                    Menu("Transparency") {
                        
                        Button {
                            opacity = 1.0
                        } label: {
                            Text("100%")
                            Image(systemName: "cube.transparent.fill")
                        }
                        
                        Button {
                            opacity = 0.5
                        } label: {
                            Text("50%")
                            Image(systemName: "cube.transparent")
                        }
                    }
                    
                } label: {
                    Image(systemName: "ellipsis.circle.fill")
                }
                
            }
        }
        .foregroundColor(.blue)
        .simultaneousGesture(drag)
    }
}
