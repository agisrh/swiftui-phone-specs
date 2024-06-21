//
//  URL.swift
//  PhoneSpecs
//
//  Created by Agis on 06/06/24.
//

import Foundation

extension URL {
    
    // URL development
    static var development: URL {
        URL(string: "https://phone-specs-api-2.azharimm.dev")!
    }
    
    // URL production
    static var production: URL {
        URL(string: "https://phone-specs-api-2.azharimm.dev")!
    }
    
    // URL default
    static var `default`: URL {
    #if DEBUG
        return development
    #else
        return production
    #endif
    }
    
    // list brands
    static var brands: URL {
        return URL(string: "/brands", relativeTo: Self.default)!.absoluteURL
    }

    // list phone by brand
    static func phoneByBrand(_ url: String) -> URL {
        return URL(string: url)!.absoluteURL
    }
    
    // phone spesification
    static func phoneSpec(_ phoneSlug: String) -> URL {
        return URL(string: "/brands/\(phoneSlug)", relativeTo: Self.default)!
    }
    
    // phone search
    static func phoneSearch(_ keyword: String) -> URL {
        return URL(string: "/search?query=\(keyword)", relativeTo: Self.default)!
    }
    
    // latest
    static var latest: URL {
        URL(string: "/latest", relativeTo: Self.default)!.absoluteURL
    }
    
    // top by interest
    static var topByInterest: URL {
        return URL(string: "/top-by-interest", relativeTo: Self.default)!.absoluteURL
    }
    
    // top by fans
    static var topByFans: URL {
        URL(string: "/top-by-fans", relativeTo: Self.default)!.absoluteURL
    }
}
