//
//  RingView.swift
//  DesignCode
//
//  Created by Yohan on 2023-08-24.
//

import SwiftUI

struct RingView: View {
    var color1 = Color.blue
    var color2 = Color.red
    var width: CGFloat = 44
    var height: CGFloat = 44
    var percent: CGFloat = 88
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
       return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: progress, to: 1) // gap
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z:0))
                .frame(width: width, height: height)
            .shadow(color: color2.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
               .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
        // line cap
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
