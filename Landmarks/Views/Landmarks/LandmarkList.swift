/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing a list of landmarks.
 */

import SwiftUI

struct LandmarkList: View {
    
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    @State private var showCategoriesOnly = ""
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var searchResults: [Landmark] {
        if searchText.isEmpty {
            return filteredLandmarks
        }else {
            return filteredLandmarks.filter { landmark in
                return landmark.name.contains(searchText) }
        }
    }
    
    var filteredCategories: [Landmark] {
        if showCategoriesOnly != "" {
            return searchResults.filter { landmark in
                return landmark.category.rawValue.contains(showCategoriesOnly) }
        } else {
            return searchResults
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Button("Lakes"){
                        showCategoriesOnly = "Lakes"
                    }
                    Button("Mountains"){
                        showCategoriesOnly = "Mountains"
                    }
                    Button("Rivers"){
                        showCategoriesOnly = "Rivers"
                    }
                    Button("Cancel"){
                        showCategoriesOnly = ""
                    }
                }
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    
                    ForEach(filteredCategories) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationTitle("Landmarks")
            }
    }
        .searchable(text: $searchText)
}
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
