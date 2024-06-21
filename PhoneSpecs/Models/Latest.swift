//
//  Latest.swift
//  PhoneSpecs
//
//  Created by Agis on 21/06/24.
//

import Foundation

// Latest Response Model
struct LatestResponse: Codable {
    let status: Bool
    let data: LatestBaseData
    
    enum CodingKeys: String, CodingKey {
        case status
        case data = "data"
    }
}


// Latest Base Data Model
struct LatestBaseData: Codable {
    let title: String
    let phones: [Latest]
    
    enum CodingKeys: String, CodingKey {
        case title
        case phones
    }
}

extension LatestBaseData {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        phones = try values.decode([Latest].self, forKey: .phones)
    }
}

// List Phone Model
struct Latest: Codable, Identifiable {
    let id = UUID()
    let phoneName: String
    let slug: String
    let image: String
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case phoneName = "phone_name"
        case slug
        case image
        case detail
    }
}


extension Latest {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        phoneName = try values.decode(String.self, forKey: .phoneName)
        slug = try values.decode(String.self, forKey: .slug)
        image = try values.decode(String.self, forKey: .image)
        detail = try values.decode(String.self, forKey: .detail)
    }
}
