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
                HStack(alignment: .lastTextBaseline) {
                    HStack {
                        Image(systemName: "mappin")
                        Text(card.lastlocation)
                    }
                    Spacer()
                    ZStack {
                        Text(card.formtype.capitalized)
                            .padding(7)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .background(card.formtype == "found" ? Color.foundGreen : Color.lostPink)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                }
                
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
                    .font(.title)
                    .foregroundStyle(.black)
                
                HStack {
                    Image(systemName: "pawprint.fill")
                    Text(card.pettype)
                    Spacer()
                    Text("Breed: \(card.petbreed)")
                }
                HStack(alignment: .firstTextBaseline){
                    Image(systemName: "paintpalette.fill")
                    Text(card.petcolor)
                    Spacer()
                    Text("Age: Adult")
                }
                HStack{
                    Text(card.petdescription)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .font(.caption)
                    Spacer()
                }
                .padding([.top], 2)
                .border(Color.gray)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                VStack {
                    card.formtype == "found" ?
                    Text("Contact founder:") : Text("Contact Owner:")
                    HStack {
                        Link(destination: URL(string: "mailto: \(card.contactemail)")!, label: {
                            Image(systemName: "envelope.circle.fill")
                        })
                        Link(destination: URL(string: "mailto: \(card.contactphone)")!, label: {
                            Image(systemName: "phone.circle.fill")
                        })
                    }
                    .padding([.top], 2)
                }
                .padding([.top], 2)
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
