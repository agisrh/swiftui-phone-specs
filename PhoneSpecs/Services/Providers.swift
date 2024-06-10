//
//  Providers.swift
//  PhoneSpecs
//
//  Created by Agis on 07/06/24.
//

import Foundation

@MainActor
class Providers: ObservableObject {
    
    @Published var brandResponse: BrandResponse = BrandResponse(status: true, brands: [])
    var apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getBrands() async throws {
        let resource = Resource(url: URL.brands, modelType: BrandResponse.self)
        brandResponse = try await apiService.load(resource)
    }
}
