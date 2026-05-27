import Foundation

protocol CharacterRepositoryProtocol {

    func fetchCharacters(
        page: Int,
        name: String?,
        status: CharacterStatus?
    ) async throws -> [Character]

    func fetchEpisodes(urls: [URL]) async throws -> [Episode]
}
