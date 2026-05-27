import Foundation

protocol FavoritesStoreProtocol {
    func toggle(id: Int)
    func isFavorite(id: Int) -> Bool
}

final class FavoritesStore: FavoritesStoreProtocol {

    private let key = "favorite_character_ids"

    func toggle(id: Int) {

        var ids = currentIDs

        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }

        UserDefaults.standard.set(Array(ids), forKey: key)
    }

    func isFavorite(id: Int) -> Bool {
        currentIDs.contains(id)
    }

    private var currentIDs: Set<Int> {
        Set(UserDefaults.standard.array(forKey: key) as? [Int] ?? [])
    }
}
