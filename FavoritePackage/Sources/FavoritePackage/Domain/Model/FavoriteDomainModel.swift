//
//  FavoriteDomainModel.swift
//  Favorite
//
//  Created by Aldi Dwiki Prahasta on 13/12/22.
//

import Foundation

public struct FavoriteDomainModel: Equatable, Identifiable {
    public init(id: Int, title: String, posterPath: String?, rating: Double, releaseDate: String) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.rating = rating
        self.releaseDate = releaseDate
    }
    
    public let id: Int
    public let title: String
    public let posterPath: String?
    public let rating: Double
    public let releaseDate: String
}
