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
            Button {
                counter += 1
            } label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            }
            
            /*
            if counter > 0 {
                Text("You've tapped \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
            */
            
            switch counter > 0 {
            case true: Text("You've tapped \(counter) times")
            case false: Text("You've not yet tapped")
            }
            
            HStack {
                switch counter > 0 {
                case true: Rectangle()
                case false: Circle()
                }
            }
            .padding()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(Color.gray)
            
        }.debug()
    }
}

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

