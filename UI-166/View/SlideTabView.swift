//
//  SlideTabView.swift
//  UI-166
//
//  Created by にゃんにゃん丸 on 2021/04/24.
//

import SwiftUI

struct SlideTabView: View {
    @State var selected = "house.fill"
    
    @State var volume : CGFloat = 0.4
    
    @State var showSlider = false
    var body: some View {
        VStack{
            
            Image("spotify")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            
            VStack{
                
                TabButton(image: "house.fill", selected: $selected)
                
                TabButton(image: "safari.fill", selected: $selected)
                
                TabButton(image: "clock.fill", selected: $selected)
                
                TabButton(image: "mic.fill", selected: $selected)
            }
            .frame(height: getRect().height / 2.3)
            .padding(.top)
            
            Spacer(minLength: getRect().height < 750 ? 35 : 50)
            
            
            Button(action: {
                
                volume = volume + 0.1 < 1.0 ? volume + 0.1 : 1
                
            }, label: {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            
            GeometryReader{proxy in
                
                let height = proxy.frame(in:.global).height
                
                let progress = height * volume
                
                ZStack(alignment:.bottom){
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 5)
                    
                    Capsule()
                        .fill(Color.red)
                        .frame(width: 5,height: progress)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }
            .padding(.vertical, getRect().height < 750 ? 10 : 20)
            
            
            
            Button(action: {
                
                volume = volume - 0.1 > 0 ? volume - 0.1 : 0
                
            }, label: {
                Image(systemName: "speaker.wave.1")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            Button(action: {
                
                withAnimation(.easeIn){
                    
                    showSlider.toggle()
                }
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.white)
                    .rotationEffect(.init(degrees: showSlider ? -180 : 0))
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            })
            .padding(.top, getRect().height < 750 ? 10 : 30)
            .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
            .offset(x: showSlider ? 0 : 100)
            
            
        }
        .frame(width: 80)
        .background(Color.black.ignoresSafeArea())
        .offset(x: showSlider ? 0 : -100)
        .padding(.trailing,showSlider ? 0 : -100)
        .zIndex(1)
    }
}

struct SlideTabView_Previews: PreviewProvider {
    static var previews: some View {
        SlideTabView()
    }
}

struct TabButton : View {
    var image : String
    @Binding var selected : String
    var body: some View{
        
        Button(action: {
            
            selected = image
            
        }, label: {
           Image(systemName: image)
            .font(.title)
            .foregroundColor(selected == image ? .white : Color.gray.opacity(0.8))
            .frame(maxHeight: .infinity)
           
        })
    }
}
