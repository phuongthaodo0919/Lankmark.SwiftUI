//
//  ModelData.swift
//  BreedDog_SwiftUI
//
//  Created by Salmdo on 4/1/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarkListData: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkListData, by: {$0.category.rawValue})
    }
    
    var features: [Landmark] {
        landmarkListData.filter {$0.isFeatured}
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file  = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in the main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Cannot load data \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Cannot decode data \(error)")
    }
}
