//
//  Phone.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import Foundation

// Phone Response Model
struct InterestResponse: Codable {
    let status: Bool
    let data: InterestBaseData
    
    enum CodingKeys: String, CodingKey {
        case status
        case data = "data"
    }
}


// Phone Base Data Model
struct InterestBaseData: Codable {
    let title: String
    let phones: [Interest]
    
    enum CodingKeys: String, CodingKey {
        case title
        case phones
    }
}

extension InterestBaseData {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        phones = try values.decode([Interest].self, forKey: .phones)
    }
}


// List Phone Model
var interestId: Int = 1
struct Interest: Codable {
    let id: Int
    let phoneName: String
    let slug: String
    let hits: Int
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case phoneName = "phone_name"
        case slug
        case hits
        case detail
    }
}


extension Interest {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = interestId
        phoneName = try values.decode(String.self, forKey: .phoneName)
        slug = try values.decode(String.self, forKey: .slug)
        hits = try values.decode(Int.self, forKey: .hits)
        detail = try values.decode(String.self, forKey: .detail)
        interestId += 1
    }
}
