//
//  PageController.swift
//  UI-166
//
//  Created by にゃんにゃん丸 on 2021/04/24.
//

import SwiftUI

struct PageController: UIViewRepresentable {
    
    var maxPage : Int
    var currentpage : Int
    func makeUIView(context: Context) -> UIPageControl {
        
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.numberOfPages = maxPage
        control.currentPage = currentpage
        return control
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentpage
        
    }
}

