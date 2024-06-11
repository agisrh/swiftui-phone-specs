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
    @Published var isLoading: Bool = true
    @Published var phones : [Phone] = []
    
    @Published var phoneResponse: PhoneResponse = PhoneResponse(status: true, data: PhoneBaseData(title: "List Phone", currentPage: 1, lastPage: 1, phones: []))
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func loadMoreContent(){
        print("here")
//           let thresholdIndex = self.phones.index(self.phones.endIndex, offsetBy: -1)
//        if thresholdIndex == item.id, (page + 1) <= totalPages {
//               page += 1
//               getUsers()
//           }
       }
    
    func getPhoneByBrand(_ url: String, page: Int = 1) async throws {
        let resource = Resource(url: URL.phoneByBrand(url, page: page), modelType: PhoneResponse.self)
        phoneResponse = try await apiService.load(resource)
        totalPages = phoneResponse.data.lastPage
        phones.append(contentsOf: phoneResponse.data.phones)
        isLoading = false
    }
}
