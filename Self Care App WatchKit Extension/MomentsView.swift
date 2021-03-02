//
//  MomentsView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentsView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let y = proxy.frame(in: .global).minY
        
        let diff = abs(y)
        
        if diff < 100 {
            scale = 1 + (diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
                        
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                
                ForEach(0..<6) { number in
                    
                    GeometryReader { proxy in
                        
                        let scale = getScale(proxy: proxy)
                        
                        Text("Almoço com família e filhos")
                            .font(.system(size: 15, weight: .semibold))
                            .padding(10)
                            .frame(width: 150, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaleEffect(CGSize(width: scale, height: scale))
                    }
                    .background(Color.gray)
                    .frame(width: 150, height: 90, alignment: .center)
                    .cornerRadius(15.0)
                }
            }.padding(30)
        }
    }
}

struct MomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MomentsView()
    }
}

