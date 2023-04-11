//
//  LandmarkList.swift
//  BreedDog_SwiftUI
//
//  Created by Salmdo on 4/1/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly: Bool = false
   
    var filteredLandmarks: [Landmark] {
        modelData.landmarkListData.filter { lMark in
            (!showFavoritesOnly || lMark.isFavorite)
        }
    }
    
    
    var body: some View {
        NavigationView {
            List{
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorite Only")
                }
                
                ForEach(filteredLandmarks){ lMark in
                    NavigationLink{
                        LandmarkDetail(landmark: lMark)
                    } label: {
                        LandmarkRow(landmark: lMark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
       
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id:\.self){
            deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
        }
        
    }
}
