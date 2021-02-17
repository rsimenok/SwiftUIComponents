//
//  FilteredList.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 1/21/21.
//  Copyright © 2021 PragCore. All rights reserved.
//

import Foundation
import SwiftUI

public protocol StringFilterable: CustomStringConvertible, Hashable {
    var filter: String { get }
}

public struct FilteredList<Element: StringFilterable,
                           Content: View>: View {
    
    let title: (Element) -> String
    let list: [Element]
    @State var filter: String = ""
    @State var filteredList: [Element] = []
    var content: (Element) -> Content
    var onDelete: (((IndexSet) -> Void)?)
    @State var selection = Set<Element>()
    
    public var body: some View {
        let binding = Binding(
            get: { self.filter },
            set: { text in
                
                self.filter = text
                print("filter: \(filter)")
                
                if filter.isEmpty {
                    filteredList = list
                } else {
                    filteredList = list.filter{
                        $0.filter
                            .lowercased()
                            .contains(filter.lowercased())
                    }
                    .sorted {
                        $0.description < $1.description
                    }
                }
                print("filtered count: \(filteredList.count)")
            }
        )
        
        return VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("filter", text: binding.animation(.spring()))
                    .padding([.top, .bottom], 8)
                    .modifier(Modifier.ClearButton(text: binding))
            }
            .padding([.leading, .trailing], 16)
            .background(
                Color.gray.opacity(0.2)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 8)
            )
            
            Divider()
            
            List(selection: $selection) {
                if filteredList.isEmpty {
                    Text("Nothing to show")
                } else {
                    ForEach(filteredList,
                            id:\.self.filter) { element in
                        content(element)
                            .navigationBarTitle(title(element))
                    }
                    .onDelete(perform: onDelete)
                }
            }
        }
        .onAppear {
            self.filteredList = list
        }
    }
    
    public init(_ title: @escaping (Element) -> String = {_ in ""},
                list: [Element],
                selection: Set<Element> = Set<Element>(),
                @ViewBuilder content: @escaping (Element) -> Content) {
        self.title = title
        self.list = list.sorted {
            $0.description < $1.description
        }
        self.content = content
        self.selection = selection
    }
}

extension FilteredList {
    
    public func onDelete(offsets: @escaping (IndexSet) -> Void ) -> Self {
        var copy = self
        copy.onDelete = offsets
        return copy
    }
}
