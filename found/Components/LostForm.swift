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
            
    @State var viewModel:LostFormViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Lost Pet Form")
                    .font(.title)
                Form {
                    ImagePickerView()
                    Section {
                        Picker("Pet type", selection: $viewModel.petType) {
                            ForEach(PetType.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                    Section {
                        TextField("Pet name", text: $viewModel.petName)
                        TextField("Pet color", text: $viewModel.petColor)
                        TextField("Pet breed", text: $viewModel.petBreed)
                        TextField("Pet description", text: $viewModel.petDescription)
                    }
                    Section {
                        TextField("Last location seen", text: $viewModel.lastLocation)
                    }
                    Section {
                        TextField("Owner email", text: $viewModel.contactEmail)
                        TextField("Owner phone", text: $viewModel.contactPhone)
                    }
                    Button(action: {
                        Task {
                            await viewModel.submitPost(
)
                        }
                    }) {
                        Text("Submit")
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}
    
struct LostFormView_Previews: PreviewProvider {
    static var previews: some View {
        LostFormView(viewModel: LostFormViewModel())
    }
}
