import Foundation

struct PaginatedResponseDTO<T: Decodable>: Decodable {
    let results: [T]
}
