//
//  CardView.swift
//  found
//
//  Created by Can Sanchez on 2024-04-24.
//

import Foundation
import SwiftUI

struct CardView: View {

    let card: Post
   

    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string:card.petimage)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 200)
                        .clipped(antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                } placeholder: {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .frame(width: 300, height: 200)
                }

                Text(card.petname)
                    .font(.largeTitle)
                    .foregroundStyle(.black)

                Text(card.lastlocation)
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            .padding(25)
            .multilineTextAlignment(.center)
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .frame(width: 350)
    }
}

#Preview {
    CardView(card: .exampleItem)
}
