import Foundation
import SwiftUI

// Network class to request "Post" data and decode as json.

class Network: ObservableObject {
        @Published var posts: [Post] = []
    
    func getPosts() {
        guard let url = URL(string: "https://api-found.vercel.app/post/") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                        self.posts = decodedPosts
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}


