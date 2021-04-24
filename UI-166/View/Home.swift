//
//  Home.swift
//  UI-166
//
//  Created by にゃんにゃん丸 on 2021/04/24.
//

import SwiftUI

struct Home: View {
    @State var selectedTab : Trip = trips[0]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in: .global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                
                
                
                
            }
            .ignoresSafeArea()
            
            
            VStack{
                
                Text("Let's Go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                
                Text("PocoTrip")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                
                
                VStack{
                    
                    GeometryReader{proxy in
                        
                        let frame = proxy.frame(in: .global)
                        
                        TabView(selection:$selectedTab){
                            
                    
                            ForEach(trips){trip in
                                
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width - 10, height: frame.height)
                                    .cornerRadius(4)
                                    .tag(trip)
                                
                            }
                            
                            
                            
                        }
                       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        
                        
                    }
                    .frame(height: getRect().height / 2.3)
                   
                    
                    
                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top,20)
                        .padding(.bottom,10)
                    PageController(maxPage: trips.count, currentpage: getIndex())
                        
                    
                    
                    
                    
                }
                .padding(.top)
                .padding(.horizontal,10)
                .padding(.bottom,15)
                .background(Color.white
                
                                .clipShape(CustomShape())
                )
                .padding(.horizontal,20)
                
                
                
                NavigationLink(
                    destination: SpotyView(),
                    label: {
                        
                        
                        Text("Get Started")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(10)
                            .padding()
                            .padding(.horizontal)
                        
                        
                    })
                
                   
               
                
                
            }
            .padding()
            .navigationBarHidden(true)
            
        }
    }
    func getIndex() -> Int{
        
        
        let index = trips.firstIndex { (trip) -> Bool in
            
            selectedTab.id == trip.id
            
        } ?? 0
        
        return index
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
