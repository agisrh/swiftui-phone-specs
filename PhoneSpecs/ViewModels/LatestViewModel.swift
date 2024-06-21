//
//  LatestViewModel.swift
//  PhoneSpecs
//
//  Created by Agis on 21/06/24.
//

import Foundation

class LatestViewModel : ObservableObject {
    
    @Published var isLoading: Bool = true
    var apiService: APIService
    
    @Published var response: LatestResponse = LatestResponse(status: true, data: LatestBaseData(title: "Latest Devices", phones: []))
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getLatestPhone() async throws {
        let resource = Resource(url: URL.latest, modelType: LatestResponse.self)
        response = try await apiService.load(resource)
        isLoading = false
    }
}
