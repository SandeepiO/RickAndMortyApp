import Foundation

extension CharacterDTO {

    func toDomain() -> Character {
        Character(
            id: id,
            name: name,
            status: CharacterStatus(rawValue: status) ?? .unknown,
            species: species,
            gender: gender,
            imageURL: URL(string: image),
            origin: origin.name,
            location: location.name,
            episodeURLs: episode.compactMap(URL.init)
        )
    }
}
