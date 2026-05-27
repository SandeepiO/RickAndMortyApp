import Foundation

protocol FetchCharactersUseCaseProtocol {
    func execute(
        page: Int,
        search: String?,
        status: CharacterStatus?
    ) async throws -> [Character]
}

final class FetchCharactersUseCase: FetchCharactersUseCaseProtocol {

    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }

    func execute(
        page: Int,
        search: String?,
        status: CharacterStatus?
    ) async throws -> [Character] {

        try await repository.fetchCharacters(
            page: page,
            name: search,
            status: status
        )
    }
}
