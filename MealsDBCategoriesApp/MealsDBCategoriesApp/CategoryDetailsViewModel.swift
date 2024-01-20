import SwiftUI

class CategoryDetailsViewModel: ObservableObject {
    @Published var categoryDetails: [CategoryDetail] = []
    
    func fetchCategoryDetails(forId: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(forId)") else {
            return
        }
        
        DatabaseFetcher.shared.fetchData(from: url) {
            (result: Result<CategoryDetails, Error>) in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self.categoryDetails = data.meals
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

