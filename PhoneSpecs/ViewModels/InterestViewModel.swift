//
//  InterestViewModel.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import Foundation

class InterestViewModel : ObservableObject {
    
    @Published var isLoading: Bool = true
    var apiService: APIService
    
    @Published var response: InterestResponse = InterestResponse(status: true, data: InterestBaseData(title: "Top 10 by daily interest", phones: []))
    
    init(apiService: APIService) {
        self.apiService = apiService

    }
    
    func getInterestPhone() async throws {
        let resource = Resource(url: URL.topByInterest, modelType: InterestResponse.self)
        response = try await apiService.load(resource)
        isLoading = false
    }
}
