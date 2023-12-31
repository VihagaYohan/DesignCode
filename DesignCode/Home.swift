//
//  Home.swift
//  DesignCode
//
//  Created by Yohan on 2023-08-20.
//

import SwiftUI

struct Home: View {
    @State var showProfile: Bool = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    
    var body: some View {
        ZStack {
            Color("background1")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HomeView(showProfile: $showProfile, showContent: $showContent)
                    .padding(.top, 44) // 44 is the size of top status bar
                    .background(
                        VStack {
                            LinearGradient(gradient: Gradient(colors: [Color("background1"), Color.white]), startPoint: .top, endPoint: .bottom)
                                .frame(height: 200)
                            Spacer()
                        }
                        .background(Color.white)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 30, style:
                            .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                    .offset(y: showProfile ? -450 : 0)
                    .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10)-10 : 0), axis: (x: 10.0, y: 0, z: 0))
                    .scaleEffect(showProfile ? 0.9 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            }
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged{ value in
                        self.viewState = value.translation
                    }
                     .onEnded{ value in
                         if self.viewState.height > 50 {
                             self.showProfile = false
                         }
                        self.viewState = .zero
                    }
                )
            if showContent {
                Color.white.edgesIgnoringSafeArea(.all)
                
                ContentView()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                        .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                    self.showContent = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool // binding with state. binding does not have a default value
    
    var body: some View {
        Button(action:{ self.showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds // getting screen size
