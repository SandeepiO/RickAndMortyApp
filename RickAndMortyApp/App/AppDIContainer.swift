import Foundation
import UIKit

final class AppDIContainer {

    private lazy var session: URLSessionProtocol = URLSession.shared

    private lazy var networkService: NetworkServiceProtocol = {
        NetworkService(session: session)
    }()

    private lazy var repository: CharacterRepositoryProtocol = {
        CharacterRepository(networkService: networkService)
    }()

    func makeCharacterListViewModel() -> CharacterListViewModel {
        CharacterListViewModel(
            fetchCharactersUseCase: FetchCharactersUseCase(
                repository: repository
            )
        )
    }
}
