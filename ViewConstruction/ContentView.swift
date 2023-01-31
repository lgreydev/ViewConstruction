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
            ForEach(1...3, id: \.self) { x in
                Text("\(x)")
                LabelView(number: $counter)
            }
        }
        .debug()
    }
}


struct LabelView: View {
    @Binding var number: Int
    
    @ViewBuilder var helper: some View {
        VStack {
            Button("Tap me!") {
                self.number += 1
            }

            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
        .padding(.bottom)
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

