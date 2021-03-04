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
                        
                        HStack {
                            Text("Momentinho de Skincare")
                                .font(.system(size: 12, weight: .semibold))
                                .frame(width: 100, height: 60, alignment: .center)
                                .scaleEffect(CGSize(width: scale, height: scale))
                            Spacer()
                            Image("p1")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding([.leading, .trailing, .bottom], 10)
                    }
                    .background(WatchColorManager.menuBackgroundColor)
                    .frame(width: 150, height: 60, alignment: .center)
                    .cornerRadius(15.0)
                }
            }.padding([.leading, .trailing], 8)
        }
    }
}

struct MomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MomentsView()
    }
}

