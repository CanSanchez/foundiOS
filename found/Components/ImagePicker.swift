//
//  ImagePicker.swift
//  found
//
//  Created by Can Sanchez on 2024-05-13.
//


import PhotosUI
import SwiftUI

struct ImagePickerView: View {
    @State private var photoItem: PhotosPickerItem?
    @State private var selectImage: Image?
    
    var body: some View {
        ZStack {
            PhotosPicker("Select photo", selection: $photoItem, matching: .images)
            
            selectImage?
                .resizable()
                .scaledToFill()
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(0)
        }
        .frame(minWidth: 400, maxHeight: 200, alignment: .center)
        .onChange(of: photoItem) {
            Task {
                if let loaded = try? await photoItem?.loadTransferable(type: Image.self) {
                    selectImage = loaded
                } else {
                    print("Failed")
                }
            }
        }
    }
}

#Preview {
   ImagePickerView()
}
