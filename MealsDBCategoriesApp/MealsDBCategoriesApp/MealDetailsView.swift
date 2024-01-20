
import SwiftUI

struct MealDetailsView: View {
    @ObservedObject var mealDetailsViewModel = MealDetailsViewModel()
    
    init(data: String) {
        self.mealDetailsViewModel.fetchMealDetails(forId: data)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                ForEach(mealDetailsViewModel.mealDetails, id: \.idMeal) {
                    meal in
                    Text(meal.strMeal)
                }
            }
        }
    }
}
