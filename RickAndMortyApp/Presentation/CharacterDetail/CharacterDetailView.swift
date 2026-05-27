import SwiftUI

struct CharacterDetailView: View {

    let character: Character

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                AsyncImage(url: character.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }

                Text(character.name)
                    .font(.largeTitle.bold())

                Group {
                    detailRow(title: "Status", value: character.status.rawValue)
                    detailRow(title: "Species", value: character.species)
                    detailRow(title: "Gender", value: character.gender)
                    detailRow(title: "Origin", value: character.origin)
                    detailRow(title: "Location", value: character.location)
                }
            }
            .padding()
        }
    }

    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.body)
        }
    }
}
