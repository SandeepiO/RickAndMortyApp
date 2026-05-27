import XCTest
@testable import RickAndMortyApp

@MainActor
final class CharacterListViewModelTests: XCTestCase {

    func test_loadInitial_fetchesCharacters() async {

        let mockUseCase = MockFetchCharactersUseCase()

        mockUseCase.result = [
            Character(
                id: 1,
                name: "Rick",
                status: .alive,
                species: "Human",
                gender: "Male",
                imageURL: nil,
                origin: "Earth",
                location: "Earth",
                episodeURLs: []
            )
        ]

        let viewModel = CharacterListViewModel(
            fetchCharactersUseCase: mockUseCase
        )

        await viewModel.loadInitial()

        XCTAssertEqual(viewModel.characters.count, 1)
    }
}
