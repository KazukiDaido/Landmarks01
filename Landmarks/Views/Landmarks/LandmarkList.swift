/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing a list of landmarks.
 */

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
   // @State private var searchText = ""
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    // let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    /*
     var searchResults: [Landmark] {
            if searchText.isEmpty {
                return modelData.landmarks
            } else {
                return modelData.landmarks.name.filter { $0.contains(searchText) }
            }
        }
    */
     
    var body: some View {
       NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        /*
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Contacts")
        }
         */
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
