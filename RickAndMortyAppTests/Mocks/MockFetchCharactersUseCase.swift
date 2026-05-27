import Foundation
@testable import RickAndMortyApp

final class MockFetchCharactersUseCase: FetchCharactersUseCaseProtocol {

    var result: [Character] = []

    func execute(
        page: Int,
        search: String?,
        status: CharacterStatus?
    ) async throws -> [Character] {
        result
    }
}
