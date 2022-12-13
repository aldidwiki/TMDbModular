//
//  FavoriteRepository.swift
//  Favorite
//
//  Created by Aldi Dwiki Prahasta on 13/12/22.
//

import Combine

protocol FavoriteRepositoryProtocol {
    func getFavorites() -> AnyPublisher<[FavoriteDomainModel], Error>
    func addFavorite(movie: FavoriteDomainModel) -> AnyPublisher<Bool, Error>
    func deleteFavorite(movieId: Int) -> AnyPublisher<Bool, Error>
}

final class FavoriteRepository: NSObject {
    typealias FavoriteInstance = (FavoriteDataSource) -> FavoriteRepository
    
    fileprivate let favoriteDataSource: FavoriteDataSource
    
    private init(favoriteDataSource: FavoriteDataSource) {
        self.favoriteDataSource = favoriteDataSource
    }
    
    static let sharedInstance: FavoriteInstance = { favoRepo in
        return FavoriteRepository(favoriteDataSource: favoRepo)
    }
}

extension FavoriteRepository: FavoriteRepositoryProtocol {
    func getFavorites() -> AnyPublisher<[FavoriteDomainModel], Error> {
        return self.favoriteDataSource.getFavorites().map {
            FavoriteMapper.mapEntitiesToDomains(entities: $0)
        }.eraseToAnyPublisher()
    }
    
    func addFavorite(movie: FavoriteDomainModel) -> AnyPublisher<Bool, Error> {
        return self.favoriteDataSource.addFavorite(movie: FavoriteMapper.mapDomainToEntity(domain: movie))
    }
    
    func deleteFavorite(movieId: Int) -> AnyPublisher<Bool, Error> {
        return self.favoriteDataSource.deleteFavorite(from: movieId)
    }
}
