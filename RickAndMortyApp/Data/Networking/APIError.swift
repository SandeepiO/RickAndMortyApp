import Foundation

enum APIError: Error {
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError
    case unknown
}
