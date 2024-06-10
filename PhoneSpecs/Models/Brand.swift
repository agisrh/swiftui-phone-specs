//
//  Brand.swift
//  PhoneSpecs
//
//  Created by Agis on 06/06/24.
//

import Foundation

struct BrandResponse: Codable {
    let status: Bool
    let brands: [Brand]
    
    enum CodingKeys: String, CodingKey {
        case status
        case brands = "data"
    }
}

struct Brand: Codable, Identifiable {
    let id = UUID()
    let brandId: Int
    let brandName: String
    let brandSlug: String
    let deviceCount: Int
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case brandId = "brand_id"
        case brandName = "brand_name"
        case brandSlug = "brand_slug"
        case deviceCount = "device_count"
        case detail
    }
}


extension Brand {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        brandId = try values.decode(Int.self, forKey: .brandId)
        brandName = try values.decode(String.self, forKey: .brandName)
        brandSlug = try values.decode(String.self, forKey: .brandSlug)
        deviceCount = try values.decode(Int.self, forKey: .deviceCount)
        detail = try values.decode(String.self, forKey: .detail)
    }
}
