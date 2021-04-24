//
//  CustomShape.swift
//  UI-166
//
//  Created by にゃんにゃん丸 on 2021/04/24.
//

import SwiftUI

struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            let midwidth = rect.width / 2
            
        
            path.addLine(to: CGPoint(x: midwidth - 80, y: rect.height))
            path.addLine(to: CGPoint(x: midwidth - 70, y: rect.height - 35))
            
            path.addLine(to: CGPoint(x: midwidth + 70, y: rect.height - 35))
            
            path.addLine(to: CGPoint(x: midwidth + 80, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
        }
    }
    
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
