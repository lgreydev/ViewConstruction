//
//  ContentView.swift
//  ViewConstruction
//
//  Created by Sergey Lukaschuk on 2023-01-10.
//

import SwiftUI

struct ContentView: View {
    @State private var volume: Double = 0.5
    
    var body: some View {
        VStack {
            Knob(value: $volume)
                .frame(width: 100, height: 100)
            
            Slider(value: $volume, in: (0...1))
                .padding()
        }
    }
}

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    
func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    @Binding var value: Double // should be between 0 and 1
    @State var color: Color = .black
    
    var body: some View {
        KnobShape()
            .fill(color)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
               value = value < 0.5 ? 1 : 0
                color = Color.random()
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

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

