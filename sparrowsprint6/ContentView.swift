//
//  ContentView.swift
//  sparrowsprint6
//
//  Created by Artem Dragunov on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State   var padding: CGFloat = 8
    @State   var rectCount: Int = 7
    @State   var isHorizontal: Bool = true
    
    var body: some View {
        
        
        GeometryReader { geometry in
            let layout = isHorizontal 
            ? AnyLayout(HStackLayout(spacing: padding))
            : AnyLayout(VStackLayout(spacing: 0))
            
            layout {
                ForEach(isHorizontal
                        ? Array(0..<rectCount)
                        : Array((0..<rectCount).reversed()), id: \.self) { index in
                    blueRectangle(geometry: geometry, index: index)
                }
                
                
            }
            .onTapGesture {
                withAnimation {
                    isHorizontal.toggle()
                }
            }
            
        }
    }
    
    
    func blueRectangle(geometry: GeometryProxy, index: Int) -> some View {
        let squareHeight = geometry.size.height / CGFloat(rectCount)
        
        
        return RoundedRectangle(cornerRadius: 12)
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .offset(
                x: isHorizontal 
                ? 0
                : CGFloat(index) * (geometry.size.width - squareHeight) / CGFloat(rectCount - 1),
                
                y: isHorizontal ? geometry.size.height / 2 : 0
            )
    }
    
}


#Preview {
    ContentView()
}
