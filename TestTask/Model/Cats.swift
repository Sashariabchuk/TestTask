//
//  Cats.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 03.01.2022.
//

import Foundation

struct Cats: Codable {
    let id: String
    let createdAt: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, tags
        case createdAt = "created_at"
    }
}
