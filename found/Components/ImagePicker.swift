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
        VStack {
            PhotosPicker("Select photo", selection: $photoItem, matching: .images)
            
            selectImage?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        }

        .frame(height: 150)
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
