import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    func fetchCategories() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/categories.php") else {
            return
        }
        
        DatabaseFetcher.shared.fetchData(from: url) {
            (result: Result<Categories, Error>) in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self.categories = data.categories
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
