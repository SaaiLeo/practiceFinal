//
//  Category.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import Foundation

struct Category: Codable {
    let name: String
    let image: String
}

struct CategoryList: Codable {
    let categories: [Category]
}
