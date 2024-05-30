//
//  LostForm-ViewModel.swift
//  found
//
//  Created by Can Sanchez on 2024-05-29.
//

import Foundation

@MainActor protocol FormViewModelProtocol {
    var posts : [Post] { get }
}

@Observable class LostFormViewModel: FormViewModelProtocol {
    var posts = [Post]()
    
    public var petType = PetType.cat
    public var petName = ""
    public var petColor = ""
    public var petBreed = ""
    public var petDescription = ""

    public var lastLocation = ""
    public var contactEmail = ""
    public var contactPhone = ""
    
    // Function to submit post
    func submitPost() async {
        let post = Post(
            id: nil,
            createdat: ISO8601DateFormatter().string(from: Date()),
            petname: petName,
            petimage: "https://placedog.net/400x200",  // This should be dynamic if you have an image picker
            lastlocation: lastLocation,
            formtype: "Lost",
            pettype: petType.rawValue,
            petbreed: petBreed,
            petcolor: petColor,
            petdescription: petDescription,
            contactemail: contactEmail,
            contactphone: contactPhone,
            updatedat: ISO8601DateFormatter().string(from: Date()),
            longitude: 0.0,  // Replace with actual data
            latitude: 0.0   // Replace with actual data
        )

        guard let url = URL(string: "https://api-found.vercel.app/post/create/") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(post)
            request.httpBody = jsonData

            let (body, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                print("Invalid response: \(String(describing: response))")
                print(String(data:body, encoding: .utf8)!)
                return
            }

            print("Post submitted successfully!")
        } catch {
            print("Error encoding post: \(error.localizedDescription)")
        }
    }
    // function to submit post ends
}

enum PetType:String, CaseIterable {
    case cat = "Cat"
    case dog = "Dog"
    case bunny = "Bunny"
    case coyote = "Coyote"
}


