import Foundation

extension EpisodeDTO {

    func toDomain() -> Episode {
        Episode(
            id: id,
            name: name,
            airDate: air_date
        )
    }
}
