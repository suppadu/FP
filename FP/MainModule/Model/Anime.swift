//
//  Anime.swift
//  FP
//
//  Created by Дмитрий Константинов on 10.06.2021.
//

import Foundation

struct Anime: Decodable {
    var data: DataStruct?
}

struct DataStruct: Decodable {
    var id: String
    var attributes: Attribute
}

struct Attribute: Decodable {
    var synopsis: String
    var titles: TitlesStruct?
    var ageRating: String
    var subtype: String
    var status: String
    var posterImage: ImageStruct?
    var coverImage: ImageStruct?
    var episodeCount: Int?
    var totalLength: Int?
}

struct TitlesStruct: Decodable {
    var en: String?
    var en_jp: String?
}

struct ImageStruct: Decodable {
    var original: String?
}
