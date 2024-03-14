
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
}



