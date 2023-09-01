//
//  CourseList.swift
//  DesignCode
//
//  Created by Yohan on 2023-08-25.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        VStack {
            CourseView()
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0){
                    Text("Swift UI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text("20 Sections")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                Image("Logo1")
            }
            Spacer()
            Image("Card4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        .padding(show ? 30 : 20)
        .padding(.top, show ? 30: 0)
//        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
        .frame(maxWidth: show ? .infinity : screen.width - 60,
               maxHeight: show ? .infinity : 280)
        .background(Color.purple)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.purple.opacity(0.3), radius: 20, x: 0, y: 20)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.show.toggle()
            
        }.edgesIgnoringSafeArea(.all) // infinity consider safe area
    }
}
