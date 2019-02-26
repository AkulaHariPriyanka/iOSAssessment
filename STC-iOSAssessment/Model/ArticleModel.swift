//
//  ArticleModel.swift
//  STC-iOSAssessment
//
//  Created by Hari Priyanka on 26/02/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

/**
  Model for the entire JSON data containing title and articles.
 */
struct DataModel : Codable {
    var title: String?
    var articles: [ArticleModel]?
}

/**
  Model for the articles.
 */
struct ArticleModel : Codable {
    var title: String?
    var content: String?
    var imageUrl: String?
}