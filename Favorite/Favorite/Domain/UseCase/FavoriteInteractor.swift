//
//  FavoriteUseCase.swift
//  Favorite
//
//  Created by Aldi Dwiki Prahasta on 13/12/22.
//

import Combine

public protocol FavoriteUseCase {
    func getFavorites() -> AnyPublisher<[FavoriteDomainModel], Error>
    func addFavorite(movie: FavoriteDomainModel) -> AnyPublisher<Bool, Error>
    func deleteFavorite(movieId: Int) -> AnyPublisher<Bool, Error>
}

class FavoriteInteractor: FavoriteUseCase {
    private let favoriteRepository: FavoriteRepositoryProtocol
    
    required init(repository: FavoriteRepositoryProtocol) {
        self.favoriteRepository = repository
    }
    
    func getFavorites() -> AnyPublisher<[FavoriteDomainModel], Error> {
        return favoriteRepository.getFavorites()
    }
    
    func addFavorite(movie: FavoriteDomainModel) -> AnyPublisher<Bool, Error> {
        return favoriteRepository.addFavorite(movie: movie)
    }
    
    func deleteFavorite(movieId: Int) -> AnyPublisher<Bool, Error> {
        return favoriteRepository.deleteFavorite(movieId: movieId)
    }
}
