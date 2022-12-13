//
//  FavoriteInjection.swift
//  Favorite
//
//  Created by Aldi Dwiki Prahasta on 13/12/22.
//

import CorePackage

public final class FavoriteInjection: NSObject {
    private func provideFavoriteRepo() -> FavoriteRepositoryProtocol {
        let realm = CoreInjection.init().provideRealm()
        
        let source = FavoriteDataSource.sharedInstance(realm)
        return FavoriteRepository.sharedInstance(source)
    }
    
    public func provideFavoriteUseCase() -> FavoriteUseCase {
        return FavoriteInteractor(repository: provideFavoriteRepo())
    }
}
