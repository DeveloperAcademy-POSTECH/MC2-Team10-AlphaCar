//
//  DragRelocateDelegate.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI
import UniformTypeIdentifiers

struct DragRelocateDelegate: DropDelegate {
    @Binding var dropText: String
    @Binding var onDrag: Bool
    
    func dropEntered(info: DropInfo) {
        
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: [UTType.text]) else {
            return false
        }
        let items = info.itemProviders(for: [UTType.text])
        for item in items {
            _ = item.loadObject(ofClass: String.self) { str, _ in
                if let str = str {
                    dropText = str
                }
            }
        }
        return true
    }
}

