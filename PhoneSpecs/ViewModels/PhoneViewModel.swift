//
//  PhoneViewModel.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import Foundation

@MainActor
class PhoneViewModel: ObservableObject {
    
    var apiService: APIService
    var totalPages = 0
    var page : Int = 1
    
    @Published var isLoading = true
    @Published var isLoadMore = false
    @Published var phones : [Phone] = []
    
    @Published var phoneResponse: PhoneResponse = PhoneResponse( status: true, data: PhoneBaseData(title: "List Phone", currentPage: 1, lastPage: 1, phones: []))
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func loadMoreContent(index currentIndex: Int, url currentUrl: String) async throws {
        let thresholdIndex = self.phones.index(self.phones.endIndex, offsetBy: -1)
        if thresholdIndex == currentIndex, (page + 1) <= totalPages {
            isLoadMore = true
            page += 1
            try await getPhoneByBrand(currentUrl)
        }
    }
    
    func getPhoneByBrand(_ url: String) async throws {
        let resource = Resource(url: URL.phoneByBrand(url), method: .get([URLQueryItem(name: "page", value: "\(page)")]), modelType: PhoneResponse.self)
        phoneResponse = try await apiService.load(resource)
        totalPages = phoneResponse.data.lastPage
        phones.append(contentsOf: phoneResponse.data.phones)
        isLoading = false
        isLoadMore = false
    }
}
