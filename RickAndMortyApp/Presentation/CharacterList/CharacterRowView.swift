import SwiftUI

struct CharacterRowView: View {

    let character: Character

    var body: some View {

        HStack(spacing: 16) {

            AsyncImage(url: character.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 8) {

                Text(character.name)
                    .font(.headline)

                Text(character.species)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                StatusBadgeView(status: character.status)
            }
        }
        .padding(.vertical, 8)
    }
}
