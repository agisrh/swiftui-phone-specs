//
//  Phone.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import Foundation

// Phone Response Model
struct PhoneResponse: Codable {
    let status: Bool
    let data: PhoneBaseData
    
    enum CodingKeys: String, CodingKey {
        case status
        case data = "data"
    }
}


// Phone Base Data Model
struct PhoneBaseData: Codable {
    let title: String
    let currentPage: Int
    let lastPage: Int
    let phones: [Phone]
    
    enum CodingKeys: String, CodingKey {
        case title
        case currentPage = "current_page"
        case lastPage = "last_page"
        case phones
    }
}

extension PhoneBaseData {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        currentPage = try values.decode(Int.self, forKey: .currentPage)
        lastPage = try values.decode(Int.self, forKey: .lastPage)
        phones = try values.decode([Phone].self, forKey: .phones)
    }
}


// List Phone Model
var phoneId: Int = 1
struct Phone: Codable {
    let id: Int
    let brand: String
    let phoneName: String
    let slug: String
    let image: String
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case brand
        case phoneName = "phone_name"
        case slug
        case image
        case detail
    }
}


extension Phone {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = phoneId
        brand = try values.decode(String.self, forKey: .brand)
        phoneName = try values.decode(String.self, forKey: .phoneName)
        slug = try values.decode(String.self, forKey: .slug)
        image = try values.decode(String.self, forKey: .image)
        detail = try values.decode(String.self, forKey: .detail)
        phoneId += 1
    }
}
