//
//  ContentView.swift
//  sparrowsprint6
//
//  Created by Artem Dragunov on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State   var padding: CGFloat = 10
    @State   var size: CGFloat = 100
    @State   var rectCount: Int = 4
    var body: some View {
        HStack {
            ForEach(0..<rectCount, id: \.self) { _ in
                self.coloredRectangle()
            }
        }.padding(padding)
    }
    
    func coloredRectangle() -> some View {
        Rectangle()
            .frame(width: calculateRectSize(), height: calculateRectSize())
            .foregroundColor(randomColor())
    }
    
    func randomColor() -> Color {
        let colors: [Color] = [.blue, .red, .cyan, .mint, .purple]
        return colors.randomElement() ?? .black
    }
    
    
    func calculateRectSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let totalPadding = CGFloat(rectCount - 1) * padding
        let rectWidth = (screenWidth - totalPadding) / CGFloat(rectCount)
        
        return rectWidth
    }
    
    
}


#Preview {
    ContentView()
}
