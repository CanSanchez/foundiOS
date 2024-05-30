
import Foundation

//Model for Post data

struct Post: Identifiable, Codable, Hashable {
    let id: String?
    let createdat: String
    let petname: String
    let petimage: String
    let lastlocation: String
    let formtype: String
    let pettype: String
    let petbreed: String
    let petcolor: String
    let petdescription: String
    let contactemail: String
    let contactphone: String
    let updatedat: String
    let longitude: Float
    let latitude: Float
    
    static var exampleItem = Post(
        id: "1",
        createdat: "01/01/2024",
        petname: "Tom",
        petimage: "https://res.cloudinary.com/djhxv0heo/image/upload/v1678926491/mb5zx0zt0oalvwwyac8q.jpg",
        lastlocation: "Vancouver",
        formtype: "found",
        pettype: "Cat",
        petbreed: "Siamese",
        petcolor: "Chocolate Brown",
        petdescription: "Grumpy and likes to stare",
        contactemail: "example@apple.com",
        contactphone: "7781231234",
        updatedat: "01/01/2024",
        longitude: 49.12,
        latitude: -123.10
    )
}



