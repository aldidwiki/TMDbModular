//
//  FavoriteMapper.swift
//  Favorite
//
//  Created by Aldi Dwiki Prahasta on 13/12/22.
//

import Foundation

final class FavoriteMapper {
    static func mapDomainToEntity(domain: FavoriteDomainModel) -> FavoriteEntity {
        let favorite = FavoriteEntity()
        favorite.id = domain.id
        favorite.title = domain.title
        favorite.posterPath = domain.posterPath ?? ""
        favorite.rating = domain.rating
        favorite.releasedDate = domain.releaseDate
        return favorite
    }
    
    static func mapEntitiesToDomains(entities: [FavoriteEntity]) -> [FavoriteDomainModel] {
        return entities.map { favorite in
            FavoriteDomainModel(id: favorite.id, title: favorite.title, posterPath: favorite.posterPath, rating: favorite.rating, releaseDate: favorite.releasedDate)
        }
    }
}
