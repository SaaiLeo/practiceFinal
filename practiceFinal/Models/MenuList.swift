//
//  MenuList.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import Foundation

struct Menu: Codable {
    let name: String
    let image: String
    let price: String
}

struct MenuList: Codable {
    let menus: [Menu]
}
