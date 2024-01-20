import SwiftUI

struct ContentView: View {
    @ObservedObject var categoriesViewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(categoriesViewModel.categories, id:\.idCategory) { category in
                    NavigationLink(
                        destination: CategoryDetailsView(data: category.strCategory),
                        label: {
                            Text(category.strCategory)
                        }
                    )
                }
            }
        }.onAppear {
            categoriesViewModel.fetchCategories()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
