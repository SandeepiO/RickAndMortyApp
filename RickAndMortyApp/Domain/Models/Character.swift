import Foundation

struct Character: Identifiable, Equatable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: String
    let imageURL: URL?
    let origin: String
    let location: String
    let episodeURLs: [URL]
}
