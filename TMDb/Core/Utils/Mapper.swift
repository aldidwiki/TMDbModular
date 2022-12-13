//
//  Mapper.swift
//  TMDb
//
//  Created by Aldi Dwiki Prahasta on 24/11/22.
//

import FavoritePackage

final class Mapper {
    static func mapMovieResponseModelsToDomains (
        input movieResponseModels: [MovieResponseModel]
    ) -> [MovieModel] {
        return movieResponseModels.map { item in
            MovieModel(
                id: item.id,
                title: item.title,
                posterPath: item.posterPath,
                rating: item.rating,
                releaseDate: item.releaseDate
            )
        }
    }
    
    static func mapMovieResponsesToEntities (
        input movieResponseModels: [MovieResponseModel]
    ) -> [MovieEntity] {
        return movieResponseModels.map { item in
            let movieEntity = MovieEntity()
            movieEntity.id = item.id
            movieEntity.title = item.title
            movieEntity.posterPath = item.posterPath ?? ""
            movieEntity.rating = item.rating
            movieEntity.releaseDate = item.releaseDate
            return movieEntity
        }
    }
    
    static func mapMoviesEntitiesToDomains (
        input moviesEntities: [MovieEntity]
    ) -> [MovieModel] {
        return moviesEntities.map { item in
            MovieModel(
                id: item.id,
                title: item.title,
                posterPath: item.posterPath,
                rating: item.rating,
                releaseDate: item.releaseDate
            )
        }
    }
    
    static func mapMovieDetailResponseToDomain(
        input movieDetailResponse: MovieDetailResponse
    ) -> MovieDetailModel {
        return MovieDetailModel(
            id: movieDetailResponse.id,
            title: movieDetailResponse.title,
            rating: movieDetailResponse.rating,
            posterPath: movieDetailResponse.posterPath,
            overview: movieDetailResponse.overview,
            tagline: movieDetailResponse.tagline,
            releaseDate: movieDetailResponse.releaseDate
        )
    }
    
    static func mapDetailDomainToFavoriteDomain(detail: MovieDetailModel) -> FavoriteDomainModel {
        let favorite = FavoriteDomainModel(id: detail.id, title: detail.title, posterPath: detail.posterPath, rating: detail.rating, releaseDate: detail.releaseDate)
        
        return favorite
    }
    
    static func mapFavoriteDomainToMovieDomain(favorite: FavoriteDomainModel) -> MovieModel {
        return MovieModel(id: favorite.id, title: favorite.title, posterPath: favorite.posterPath, rating: favorite.rating, releaseDate: favorite.releaseDate)
    }
}
