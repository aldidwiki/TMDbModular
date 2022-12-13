//
//  TMDbRepository.swift
//  TMDb
//
//  Created by Aldi Dwiki Prahasta on 24/11/22.
//

import Foundation
import Combine

protocol TMDbRepositoryProtocol {
    func getMovies() -> AnyPublisher<[MovieModel], Error>
    func getMovie(movieId: Int) -> AnyPublisher<MovieDetailModel, Error>
    func searchMovie(query: String) -> AnyPublisher<[MovieModel], Error>
}

final class TMDbRepository: NSObject {
    typealias TMDbInstance = (RemoteDataSource, LocaleDataSource) -> TMDbRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(remote: RemoteDataSource, locale: LocaleDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: TMDbInstance = { remoteRepo, localeRepo in
        return TMDbRepository(remote: remoteRepo, locale: localeRepo)
    }
}

extension TMDbRepository: TMDbRepositoryProtocol {
    func getMovies() -> AnyPublisher<[MovieModel], Error> {
        return self.locale.getMovies()
            .flatMap { result -> AnyPublisher<[MovieModel], Error> in
                if result.isEmpty {
                    return self.remote.getMovies()
                        .map { Mapper.mapMovieResponsesToEntities(input: $0) }
                        .flatMap {
                            self.locale.addMovies(from: $0)
                        }
                        .filter { $0 }
                        .flatMap { _ in
                            self.locale.getMovies()
                                .map { Mapper.mapMoviesEntitiesToDomains(input: $0) }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getMovies()
                        .map { Mapper.mapMoviesEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getMovie(movieId: Int) -> AnyPublisher<MovieDetailModel, Error> {
        return self.remote.getMovie(movieId: movieId)
            .map {
                Mapper.mapMovieDetailResponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    
    func searchMovie(query: String) -> AnyPublisher<[MovieModel], Error> {
        return self.remote.searchMovie(query: query)
            .map {
                Mapper.mapMovieResponseModelsToDomains(input: $0)
            }.eraseToAnyPublisher()
    }
}
