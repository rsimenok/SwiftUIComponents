//
//  ViewModifier.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 1/21/21.
//  Copyright © 2021 PragCore. All rights reserved.
//

import Foundation
import SwiftUI

public enum Modifier {
    
    struct ClearButton: ViewModifier {

        @Binding var text: String

        public init(text: Binding<String>) {
            self._text = text
        }

        public func body(content: Content) -> some View {
            HStack(alignment: .center) {
                content

                Spacer()
                
                if !text.isEmpty {
                    Button(action: {
                        withAnimation {
                            self.text = ""
                        }
                    }) {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
            }
        }
    }
}
