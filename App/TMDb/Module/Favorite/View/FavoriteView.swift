//
//  FavoriteView.swift
//  TMDb
//
//  Created by Aldi Dwiki Prahasta on 25/11/22.
//

import SwiftUI
import Favorite

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                if presenter.loadingState {
                    ProgressView("Loading")
                } else {
                    if presenter.favorites.isEmpty {
                        EmptyView(emptyTitle: "No Favorites Found")
                    } else {
                        List(self.presenter.favorites) { movie in
                            presenter.linkBuilder(for: movie.id) {
                                MovieItem(movie: Mapper.mapFavoriteDomainToMovieDomain(favorite: movie))
                            }
                        }
                    }
                }
            }.onAppear {
                self.presenter.getFavorites()
            }.navigationTitle("Favorite Movies")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let favoriteUseCase = FavoriteInjection.init().provideFavoriteUseCase()
        FavoriteView(presenter: FavoritePresenter(favoriteUseCase: favoriteUseCase))
    }
}
