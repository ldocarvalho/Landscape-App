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
                    .padding([.leading, .trailing], 8)
                    .navigationTitle(Text(pergunta))
                    .foregroundColor(ColorManager.cardTitleColor)
                    .frame(width: 330, height: 100, alignment: .leading)
                Text(mensagem)
                    .fontWeight(.medium)
                    .font(.body)
                    .padding([.leading, .trailing], 16)
                    .foregroundColor(ColorManager.bodyTextColor)
                    .multilineTextAlignment(.leading)
                    .frame(width:350, height: 350, alignment: .topLeading)
            }.background(ColorManager.cardColor)
            .cornerRadius(25)
        }
    }
}

struct AvisoView_Previews: PreviewProvider {
    static var previews: some View {
        AvisoView(mensagem: "coloque o aviso aqui",pergunta: "What is self care?")
        
    }
}
