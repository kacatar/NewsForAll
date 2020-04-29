//
//  PostArticleData.swift
//  Mandiri News
//
//  Created by Helmi on 29/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import Foundation

struct ArticleResults: Decodable {
    let articles: [ArticlePost]
}


struct ArticlePost: Decodable, Identifiable {
    var id: String {
        return publishedAt!
    }
    let name: String?
    let title: String?
    let url: String?
    let publishedAt: String?
    let author: String?
}
