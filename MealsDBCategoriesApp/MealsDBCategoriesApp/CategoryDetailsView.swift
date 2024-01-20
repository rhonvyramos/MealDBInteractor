
import SwiftUI

struct CategoryDetailsView: View {
    @ObservedObject var categoryDetailsViewModel = CategoryDetailsViewModel()
    
    init(data: String) {
        self.categoryDetailsViewModel.fetchCategoryDetails(forId: data)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(categoryDetailsViewModel.categoryDetails, id:\.idMeal) { meal in
                    NavigationLink(
                        destination: MealDetailsView(data: meal.idMeal),
                        label: {
                            Text(meal.strMeal)
                        }
                    ).onAppear {
                        
                    }
                }
            }
        }
        .padding()
    }
}
