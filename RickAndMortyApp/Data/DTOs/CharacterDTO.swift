import Foundation

struct CharacterDTO: Decodable {

    struct LocationDTO: Decodable {
        let name: String
    }

    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let episode: [String]
    let origin: LocationDTO
    let location: LocationDTO
}
