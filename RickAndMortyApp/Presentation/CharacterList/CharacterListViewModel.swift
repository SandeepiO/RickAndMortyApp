import Foundation
import Combine

@MainActor
final class CharacterListViewModel: ObservableObject {

    @Published private(set) var characters: [Character] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    @Published var searchText = ""

    private let fetchCharactersUseCase: FetchCharactersUseCaseProtocol

    private var currentPage = 1
    private var canLoadMore = true
    private var cancellables = Set<AnyCancellable>()

    init(fetchCharactersUseCase: FetchCharactersUseCaseProtocol) {
        self.fetchCharactersUseCase = fetchCharactersUseCase

        bindSearch()
    }

    func loadInitial() async {
        currentPage = 1
        characters = []
        canLoadMore = true

        await loadCharacters()
    }

    func loadMoreIfNeeded(currentItem: Character) async {
        guard currentItem.id == characters.last?.id else {
            return
        }

        guard canLoadMore else {
            return
        }

        currentPage += 1
        await loadCharacters()
    }

    private func loadCharacters() async {

        guard !isLoading else { return }

        isLoading = true

        do {
            let fetched = try await fetchCharactersUseCase.execute(
                page: currentPage,
                search: searchText.isEmpty ? nil : searchText,
                status: nil
            )

            if fetched.isEmpty {
                canLoadMore = false
            }

            characters.append(contentsOf: fetched)

        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    private func bindSearch() {
        $searchText
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] _ in
                Task {
                    await self?.loadInitial()
                }
            }
            .store(in: &cancellables)
    }
}
