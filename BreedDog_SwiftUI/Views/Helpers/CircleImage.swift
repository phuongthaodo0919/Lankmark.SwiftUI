//
//  CircleImage.swift
//  BreedDog_SwiftUI
//
//  Created by Salmdo on 3/31/23.
//

import SwiftUI
import MapKit

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(.white, lineWidth: 10))
            .shadow(radius: 7)

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
