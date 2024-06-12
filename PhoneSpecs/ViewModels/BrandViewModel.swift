//
//  BrandViewModel.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import Foundation

class BrandViewModel : ObservableObject {
    
    var apiService: APIService
    @Published var isLoading = true
    @Published var brandResponse: BrandResponse = BrandResponse(status: true, brands: [])
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getBrands() async throws {
        let resource = Resource(url: URL.brands, modelType: BrandResponse.self)
        brandResponse = try await apiService.load(resource)
        isLoading = false
    }
}
