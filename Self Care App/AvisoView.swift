//
//  AvisoView.swift
//  Self Care App
//
//  Created by Victor Vidal on 03/03/21.
//

import Foundation
import SwiftUI


struct AvisoView: View {
    @State public var mensagem: String
    @State public var pergunta: String
    var body: some View {
        VStack {
            VStack {
                Text(pergunta)
                    .font(.title)
                    .fontWeight(.bold)
                    .navigationTitle(Text(pergunta))
                    .foregroundColor(ColorManager.cardTitleColor)
                    .padding()
                    .frame(width: 330, height: 100, alignment: .leading)
                Text(mensagem)
                    .fontWeight(.medium)
                    .font(.title3)
                    .padding(10)
                    .foregroundColor(ColorManager.bodyTextColor)
                    .frame(width:350, height: 600, alignment: .leading)
            }.background(ColorManager.cardColor)
            .cornerRadius(15)
        }
        
    }
    
}
struct AvisoView_Previews: PreviewProvider {
    static var previews: some View {
        AvisoView(mensagem: "coloque o aviso aqui",pergunta: "What is self care?")
        
    }
}
