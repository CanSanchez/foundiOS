
import Foundation

//Model for Post data

struct Post: Identifiable, Codable, Hashable {
    var id: String {
        self.pk
    }
    let pk: String
    let createdat: String
    let petname: String
    let petimage: String
    let lastlocation: String
    let formtype: String
    let pettype: String
    let petbreed: String
    let petcolor: String
    let petdescription: String
    
    static var exampleItem = Post(
        pk: "1",
        createdat: "01/01/2024",
        petname: "Tom",
        petimage: "https://res.cloudinary.com/djhxv0heo/image/upload/v1678926491/mb5zx0zt0oalvwwyac8q.jpg",
        lastlocation: "Vancouver",
        formtype: "found",
        pettype: "Cat",
        petbreed: "Siamese",
        petcolor: "Chocolate Brown",
        petdescription: "Grumpy and likes to stare"
    )
}



