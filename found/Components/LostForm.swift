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
    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Form here")
            }
        }
    }
}
#Preview {
    LostFormView()
}
