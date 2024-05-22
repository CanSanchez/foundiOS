//
//  LostForm.swift
//  found
//
//  Created by Can Sanchez on 2024-03-07.
//

import Foundation
import SwiftUI

//TODO: Create actual form

struct LostFormView: View {
    @State private var petType = "Cat"
    @State private var petName = ""
    @State private var petColor = ""
    @State private var petBreed = ""
    @State private var petDescription = ""
    let pettypes = ["Cat", "Dog", "Bunny"]
    
    @State private var lastLocation = ""
    @State private var contactEmail = ""
    @State private var contactPhone = ""

    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Lost Pet Form")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Form {
                    ImagePickerView()
                    Section {
                        Picker("Pet type", selection: $petType) {
                                ForEach(pettypes, id: \.self) {
                                    Text($0)
                                }
                            }
                       }
                    Section {
                        TextField("Pet name", text: $petName)
                        TextField("Pet color", text: $petColor)
                        TextField("Pet breed", text: $petBreed)
                        TextField("Pet description", text: $petDescription)
                    }
                    Section {
                        TextField("Last location seen", text: $lastLocation)
                    }
                    Section {
                        TextField("Owner email", text: $contactEmail)
                        TextField("Owner phone", text: $contactPhone)
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}
    
#Preview {
    LostFormView()
}
