import Foundation

struct Categories: Decodable {
    let categories: [Category]
}

// all category attributes from mealDB are non-null values
struct Category: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

struct CategoryDetails: Decodable {
    let meals: [CategoryDetail]
}

struct CategoryDetail: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
