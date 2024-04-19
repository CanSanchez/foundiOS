
import Foundation

//Model for Post data

struct Post: Identifiable, Codable, Hashable {
    var id: String {
        self.pk
    }
    let pk: String
    let createdat: String
    let petname: String
    let lastlocation: String
    
    static var exampleItem = Post(pk: "1", createdat: "01/01/2024", petname: "Tom", lastlocation: "Vancouver")
}



