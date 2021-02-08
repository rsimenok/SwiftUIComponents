//
//  PagesView.swift
//  PagesView
//
//  Created by Moi Gutierrez on 12/12/20.
//

import SwiftUI
import AVFoundation

public struct PagesView<Content: View>: View {

    public enum SelectionDirection {
        case horizontal
        // TODO: implement
        case vertical
    }
    
    @Binding var pageCount: Int
    @Binding var currentIndex: Int
    @Binding var isSelecting: Bool
    @GestureState private var translation: CGFloat = 0
    
    var selectionDirection: SelectionDirection
    let selectionTolerance: CGFloat = 0.1
    let content: Content
    let animationsDuration = 0.3
    
    public var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                HStack(spacing: 8) {
                    self.content
                        .frame(width: geometry.size.width)
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
                .offset(x: self.translation)
                .animation(.easeIn(duration: animationsDuration))
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            // check if translating in "selection direction"
                            switch selectionDirection {
                            case .horizontal:
                                if (percentageOf(width: geometry.size.width,
                                                 startLocation: value.startLocation.x,
                                                 newLocation: value.location.x) >= selectionTolerance) {
                                    withAnimation {
                                        update(selectingState: true)
                                    }
                                    
                                } else {
                                    withAnimation {
                                        update(selectingState: false)
                                    }
                                }
                            case .vertical: break
                            }
                        })
                        .updating(self.$translation) { value, state, _ in
                            
                            state = value.translation.width

                        }.onEnded { value in
                            let offset = value.translation.width / geometry.size.width
                            let newIndex = Int((CGFloat(self.currentIndex) - offset).rounded())
                            withAnimation {
                                self.currentIndex = min(max(newIndex, 0), self.pageCount - 1)
                                DispatchQueue.main
                                    .asyncAfter(deadline: .now() + animationsDuration) {
                                    update(selectingState: false)
                                }
                            }

                        }
                    )
                
                VStack {
                    Spacer()
                    PageControl(currentpage: $currentIndex,
                                pageCount: $pageCount,
                                isSelecting: $isSelecting)
                        .scaleEffect(
                            CGSize(width: isSelecting ? 2.0:1.0,
                                   height: isSelecting ? 2.0:1.0)
                        )
                }
                .padding()
            }
            // if there is only one page don't enable interaction
            .disabled(pageCount <= 1)
        }
    }
    
    init(pageCount: Binding<Int>,
         currentIndex: Binding<Int>,
         isSelecting: Binding<Bool>,
         selectionDirection: SelectionDirection = .horizontal,
         @ViewBuilder content: () -> Content) {
        self._pageCount = pageCount
        self._currentIndex = currentIndex
        self._isSelecting = isSelecting
        self.selectionDirection = selectionDirection
        self.content = content()
    }
    
    private func update(selectingState: Bool) {
        if selectingState != isSelecting {
            isSelecting = selectingState
            UIImpactFeedbackGenerator().impactOccurred(intensity: .infinity)
            AudioServicesPlaySystemSound(UInt32(1104))
        }
    }
    
    private func percentageOf(width: CGFloat,
                                      startLocation: CGFloat,
                                      newLocation: CGFloat) -> CGFloat {
        let percentage = abs(startLocation - newLocation) / width
        return percentage
    }
}
