//
//  PostSourcesData.swift
//  Mandiri News
//
//  Created by Helmi on 28/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import Foundation

struct SourceResults: Codable {
    let sources: [PostSource]
}


struct PostSource: Codable, Identifiable {
    //var uuid = UUID()
    var id: String?
    let name: String?
    let title: String?
    let url: String?
}


