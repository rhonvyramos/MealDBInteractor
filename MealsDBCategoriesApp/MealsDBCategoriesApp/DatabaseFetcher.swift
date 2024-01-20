import Foundation

class DatabaseFetcher {
    
    // only one instance of database fetcher needed
    static let shared = DatabaseFetcher()
    
    func fetchData<T: Decodable>(from url: URL, customDecoder: JSONDecoder = JSONDecoder(), completion: @escaping(Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let unknownError = NSError(domain: "", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            
            do {
                let decodedData = try customDecoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
