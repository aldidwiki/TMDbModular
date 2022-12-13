//
//  FavoriteEntity.swift
//  Favorite
//
//  Created by Aldi Dwiki Prahasta on 13/12/22.
//

import RealmSwift

class FavoriteEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var releasedDate: String = ""
    @objc dynamic var rating: Double = 0.0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
