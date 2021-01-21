//
//  FilteredList.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 1/21/21.
//  Copyright © 2021 PragCore. All rights reserved.
//

import Foundation
import SwiftUI

public protocol StringFilterable {
    var filter: String { get }
}

struct FilteredList<Element, Content: View>: View {
    
    let title: String
    let list: [StringFilterable]
    @State var filter: String = ""
    @State var filteredList: [StringFilterable] = []
    var content: (Element) -> Content
    
    public var body: some View {
        let binding = Binding(
            get: { self.filter },
            set: { text in
                withAnimation {
                    self.filter = text
                    print("filter: \(filter)")
                    filteredList = list.filter{
                        $0.filter
                            .lowercased()
                            .contains(filter.lowercased())
                    }
                    if filter.count == 0 {
                        filteredList = list
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
            
            List {
                if filteredList.isEmpty {
                    Text("Nothing to show")
                } else {
                    ForEach(filteredList,
                            id:\.self.filter) { element in
                        content(element as! Element)
                    }
                }
            }
            .navigationBarTitle(title)
        }
        .onAppear {
            self.filteredList = list
        }
    }
    
    public init(title: String,
                list: [StringFilterable],
                @ViewBuilder content: @escaping (Element) -> Content) {
        self.title = title
        self.list = list
        self.content = content
    }
}
