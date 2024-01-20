
import Foundation

class  MealDetailsViewModel: ObservableObject {
    @Published var mealDetails: [MealDetail] = []
    
    func fetchMealDetails(forId: String) {
        
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(forId)") else {
            return
        }
        
        DatabaseFetcher.shared.fetchData(from: url) {
            (result: Result<MealDetails, Error>) in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self.mealDetails = data.meals
                    let dataMirror = Mirror(reflecting: data)
                    for data in dataMirror.children {
                        if let label = data.label, label.hasPrefix("strIngredient") {
                            if (data.value as! String != "" || data.value as! String != " ") {
                                print(data.value)
                            }
                        }
                    }
                }
            case .failure(let error):
                print("An error occured. Error: \(error)")
            }
        }
    }
}
