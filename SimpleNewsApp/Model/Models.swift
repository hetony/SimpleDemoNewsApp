//
//  Models.swift
//  SimpleNewsApp
//
//  Created by Vijesh on 03/07/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct ResultRoot: Codable {
    let numResults: Int?
    let results: [NewsModel]?
    
    enum CodingKeys: String, CodingKey {
        case numResults = "num_results"
        case results
    }
}

struct NewsModel: Codable {
    let url, adxKeywords: String?
    let column: String?
    let section, byline: String?
    let title, abstract, publishedDate: String?
    let id, assetID, views: Int?
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, title, abstract
        case publishedDate = "published_date"
        case id
        case assetID = "asset_id"
        case views
    }
}









