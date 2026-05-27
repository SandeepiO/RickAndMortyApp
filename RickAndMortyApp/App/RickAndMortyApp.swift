import SwiftUI

@main
struct RickAndMortyApp: App {
    private let container = AppDIContainer()

        var body: some Scene {
            WindowGroup {
                NavigationStack {
                    CharacterListView(
                        viewModel: container.makeCharacterListViewModel()
                    )
                }
            }
        }
}
