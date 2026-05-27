import Foundation

final class CharacterRepository: CharacterRepositoryProtocol {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchCharacters(
        page: Int,
        name: String?,
        status: CharacterStatus?
    ) async throws -> [Character] {

        var components = URLComponents(
            string: "https://rickandmortyapi.com/api/character"
        )!

        var items: [URLQueryItem] = [
            URLQueryItem(name: "page", value: "\(page)")
        ]

        if let name {
            items.append(URLQueryItem(name: "name", value: name))
        }

        if let status {
            items.append(URLQueryItem(name: "status", value: status.rawValue))
        }

        components.queryItems = items

        let response: PaginatedResponseDTO<CharacterDTO> =
            try await networkService.request(url: components.url!)

        return response.results.map { $0.toDomain() }
    }

    func fetchEpisodes(urls: [URL]) async throws -> [Episode] {

        try await withThrowingTaskGroup(of: Episode.self) { group in

            for url in urls {
                group.addTask {
                    let dto: EpisodeDTO = try await self.networkService.request(url: url)
                    return dto.toDomain()
                }
            }

            var episodes: [Episode] = []

            for try await episode in group {
                episodes.append(episode)
            }

            return episodes.sorted { $0.id < $1.id }
        }
    }
}
