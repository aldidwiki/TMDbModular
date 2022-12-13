//
//  MoviesEntity.swift
//  TMDb
//
//  Created by Aldi Dwiki Prahasta on 25/11/22.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var releaseDate: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
