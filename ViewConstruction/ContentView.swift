//
//  ContentView.swift
//  ViewConstruction
//
//  Created by Sergey Lukaschuk on 2023-01-10.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
//            Button("Tap me!") { counter += 1 }
//            LabelView(number: counter)
            LabelView()
        }
        .debug()
    }
}


struct LabelView: View {
    
    @State var counter = 0
    
    var body: some View {
        VStack {
            Button("Tap me!") {
                self.counter += 1
            }

            if counter > 0 {
                Text("You've tapped \(counter) times")
            }
        }
    }
}


// MARK: Debug helper
extension View {
    func debug() -> Self {
        let arr = [10, 20]
        
        let reflection = Mirror(reflecting: arr)
        let children = reflection.children
        
        for chail in children {
            print("label: \(String(describing: chail.label))")
            print("label: \(chail.value)")
        }
        
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

