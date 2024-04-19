//////
//////  Post-ViewModel.swift
//////  found
//////
//////  Created by Can Sanchez on 2024-04-18.
//////
////
import Foundation
import SwiftUI

extension ListView {
    @MainActor class PostViewModel: ObservableObject {
        @Published var posts = [Post]()
        
        init() {
            Task {
                await getPosts()
            }
        }
                
        // Function to fetch posts
        func getPosts() async {
            guard let url = URL(string: "https://api-found.vercel.app/post/") else { fatalError("Missing URL") }

            do {
                let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Invalid response")
                    return
                }

                do {
                    let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        withAnimation {
                            self.posts = decodedPosts
                        }
                    }
                } catch {
                    print("Error decoding: ", error)
                }
            } catch {
                print("Request error: ", error)
            }
        }
    }
}
