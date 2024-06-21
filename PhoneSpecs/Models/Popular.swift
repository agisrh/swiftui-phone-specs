//
//  Popular.swift
//  PhoneSpecs
//
//  Created by Agis on 21/06/24.
//

import Foundation

// Popular Response Model
struct PopularResponse: Codable {
    let status: Bool
    let data: PopularBaseData
    
    enum CodingKeys: String, CodingKey {
        case status
        case data = "data"
    }
}


// Popular Base Data Model
struct PopularBaseData: Codable {
    let title: String
    let phones: [Popular]
    
    enum CodingKeys: String, CodingKey {
        case title
        case phones
    }
}

extension PopularBaseData {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        phones = try values.decode([Popular].self, forKey: .phones)
    }
}


// List Phone Model
var popularId: Int = 1
struct Popular: Codable {
    let id: Int
    let phoneName: String
    let slug: String
    let favorites: Int
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case phoneName = "phone_name"
        case slug
        case favorites
        case detail
    }
}


extension Popular {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = interestId
        phoneName = try values.decode(String.self, forKey: .phoneName)
        slug = try values.decode(String.self, forKey: .slug)
        favorites = try values.decode(Int.self, forKey: .favorites)
        detail = try values.decode(String.self, forKey: .detail)
        interestId += 1
    }
}
