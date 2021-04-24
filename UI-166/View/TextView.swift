//
//  TextView.swift
//  UI-166
//
//  Created by にゃんにゃん丸 on 2021/04/24.


import SwiftUI

struct TextView: View {
    @StateObject var model = TFManger()
    @State var isTapped = false
    var body: some View {
        VStack{
            
            VStack(alignment:.leading){
                
                TextField("", text: $model.txt) { (statas) in
                    
                    if statas{
                        
                        withAnimation(.easeOut){
                            isTapped = true
                            
                        }
                        
                    }
                    
                } onCommit: {
                    
                    if model.txt == ""{
                        withAnimation(.easeOut){
                            isTapped = false
                            
                        }
                    }
                    
                    
                    
                }
                .padding(.top,isTapped ? 15 : 0)
                .background(
                    
                    
                    Text("User Name")
                    
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -7 : 0,y: isTapped ? -15 : 0)
                        .foregroundColor(isTapped ? .accentColor : .gray)
                    
                    ,alignment: .leading
                
                )
                .padding(.horizontal)
                
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top,10)

                
                
            }
            .padding(.top,12)
            .background(Color.gray.opacity(0.08))
            .cornerRadius(5)
            
            
            HStack{
                
                Spacer()
                
                
                Text("\(model.txt.count) / 15")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    .padding(.top,15)
            }
        }
        .padding()
        
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

class TFManger : ObservableObject{
    
    @Published var txt = "" {
    
        didSet{
            
            if txt.count > 15 && oldValue.count <= 15{
                
                txt = oldValue
            }
        }
        
    }
    
}
