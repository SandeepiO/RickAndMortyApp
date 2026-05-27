import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(
        url: URL
    ) async throws -> T
}
