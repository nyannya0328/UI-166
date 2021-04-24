//
//  SpotyView.swift
//  UI-166
//
//  Created by にゃんにゃん丸 on 2021/04/24.
//

import SwiftUI



struct SpotyView: View {
    
    @State var txt = ""
    
    var body: some View {
        HStack{
            
            SlideTabView()
            
            
            ScrollView(showsIndicators: false, content: {
                
                VStack{
                    
                    
                        
                        
                        HStack(spacing:15){
                            
                            
                            HStack(spacing:15){
                                
                                
                                Circle()
                                    .stroke(Color.blue,lineWidth: 4)
                                    .frame(width: 25, height: 25)
                                
                                TextField("Search", text: $txt)
                                    
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            
                            
                            NavigationLink(
                                destination: TextView(),
                                label: {
                                    Image("pro")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    
                                })
                            
                            
                                
                            
                        }
                    
                    Text("Recent Played")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                    
                    
                    TabView{
                        
                        ForEach(recentlyPlayed){item in
                            
                            GeometryReader{proxy in
                                
                                
                                ZStack(alignment:.bottomLeading){
                                    
                                    Image(item.album_cover)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: proxy.frame(in: .global).width)
                                        .cornerRadius(20)
                                        .overlay(
                                        
                                        
                                            LinearGradient(gradient: .init(colors: [.clear,.clear,.black]), startPoint: .top, endPoint: .bottom)
                                                .cornerRadius(10)
                                        )
                                    
                                    HStack(spacing:10){
                                        
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Image(systemName: "play.fill")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding(20)
                                                .background(Color("logo"))
                                                .clipShape(Circle())
                                        })
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            Text(item.album_name)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            
                                            
                                            Text(item.album_author)
                                                .font(.none)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .kerning(5)
                                            
                                        })
                                        
                                    }
                                    .padding()
                                    
                                    
                                }
                                
                                
                                
                                
                            }
                            .padding(.horizontal)
                            .frame(height: 350)
                            
                            
                        }
                      
                        
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top,20)
                    
                    Text("Genred")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                    
                    let columns1 = Array(repeating: GridItem(.flexible(),spacing: 10), count: 3)
                    let columns2 = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
                    
                    
                    LazyVGrid(columns: columns1,spacing: 15, content: {
                        
                        
                        ForEach(generes,id:\.self){genre in
                            
                            
                            Text(genre)
                                
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical,8)
                                .frame(maxWidth: .infinity)
                                .background(Color.green.opacity(0.3))
                                .clipShape(Capsule())
                            
                        }
                        
                       
                    })
                    .padding(.top,20)
                    
                    
                    Text("Liked Song")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                    
                    
                    LazyVGrid(columns: columns2, spacing: 15, content: {
                        
                        
                        ForEach(likedSong.indices,id:\.self){index in
                            
                            
                            GeometryReader{proxy in
                                
                                
                                Image(likedSong[index].album_cover)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width, height: 150)
                                    .clipShape(CustomShape2(corner: index % 2 == 0 ? [.topRight,.topLeft] : [.bottomRight,.bottomLeft], radi: 30))
                                    
                                
                                
                                
                                
                                
                            }
                            .frame(height: 150)
                            
                            
                        }
                       
                    })
                    
                    
                    
                    
                
                   
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                
            })
            
        }
        .background(Color("bg").ignoresSafeArea())
        .navigationBarHidden(true)
        
    }
}

struct SpotyView_Previews: PreviewProvider {
    static var previews: some View {
        SpotyView()
    }
}

struct CustomShape2 : Shape {
    var corner : UIRectCorner
    var radi : CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}


