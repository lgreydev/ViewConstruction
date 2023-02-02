//
//  ContentView.swift
//  ViewConstruction
//
//  Created by Sergey Lukaschuk on 2023-01-10.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            
        }

    }
}


struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * pointerHeight
        let circleRect =  rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}


/*
struct LabelView: View {
    @Binding var number: Int
    
    var body: some View {
        VStack {
            Button("Tap me!") { number += 1}
            
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}
*/

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

