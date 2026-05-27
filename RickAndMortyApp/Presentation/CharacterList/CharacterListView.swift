import SwiftUI

struct CharacterListView: View {

    @StateObject var viewModel: CharacterListViewModel

    var body: some View {

        List {
            ForEach(viewModel.characters) { character in

                NavigationLink {
                    CharacterDetailView(character: character)
                } label: {
                    CharacterRowView(character: character)
                }
                .task {
                    await viewModel.loadMoreIfNeeded(currentItem: character)
                }
            }

            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Characters")
        .searchable(text: $viewModel.searchText)
        .task {
            await viewModel.loadInitial()
        }
    }
}
