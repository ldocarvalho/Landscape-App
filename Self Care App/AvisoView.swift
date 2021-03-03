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
                    .navigationTitle(Text(pergunta))
                    .padding()
                    .font(.largeTitle)
                Text(mensagem)
                    .padding(10)
                    .frame(width:350, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   
            }.background(Color.gray)
            .cornerRadius(15)
            
            
        }
        
    }
    
}
struct AvisoView_Previews: PreviewProvider {
    static var previews: some View {
        AvisoView(mensagem: "coloque o aviso aqui",pergunta: "dale?")
        
    }
}
