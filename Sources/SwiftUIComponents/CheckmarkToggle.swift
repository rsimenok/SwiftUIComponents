//
//  CheckmarkToggle.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 6/22/22.
//

import SwiftUI

public struct CheckmarkToggle: View {
    
    @Binding var isChecked: Bool
    
    public var body: some View {
        
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
        }
    }
    
    public init(isChecked: Binding<Bool>) {
        self._isChecked = isChecked
    }
}
