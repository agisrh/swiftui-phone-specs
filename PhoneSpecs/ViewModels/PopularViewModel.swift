//
//  PopularViewModel.swift
//  PhoneSpecs
//
//  Created by Agis on 21/06/24.
//

import Foundation

class PopularViewModel : ObservableObject {
    
    @Published var isLoading: Bool = true
    var apiService: APIService
    
    @Published var response: PopularResponse = PopularResponse(status: true, data: PopularBaseData(title: "Top 10 by daily interest", phones: []))
    
    init(apiService: APIService) {
        self.apiService = apiService

    }
    
    func getPopularPhone() async throws {
        let resource = Resource(url: URL.topByFans, modelType: PopularResponse.self)
        response = try await apiService.load(resource)
        isLoading = false
    }
}
