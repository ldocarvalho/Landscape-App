//
//  MomentDetailView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentDetailView: View {
    var body: some View {
        VStack {
            Image("p1")
                .resizable()
                .frame(height: 450)
            
            HStack {
                Text("Título")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            Text("Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.")
                .font(.title3)
        }
    }
}

struct MomentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MomentDetailView()
    }
}
