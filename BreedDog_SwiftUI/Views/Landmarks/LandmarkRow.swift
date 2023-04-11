//
//  LandmarkRow.swift
//  BreedDog_SwiftUI
//
//  Created by Salmdo on 4/1/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData()
    
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmarks.landmarkListData[5])
            LandmarkRow(landmark: landmarks.landmarkListData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
