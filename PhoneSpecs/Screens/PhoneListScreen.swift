//
//  PhoneListScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import SwiftUI

struct PhoneListScreen: View {
    
    @StateObject var phoneVM = PhoneViewModel(apiService: APIService.shared)
    @State private var searchText = ""
    let url: String
    let title: String
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 156))
    ]
    
    var body: some View {
        ZStack {
            // List phone
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    
                    // Loading
                    if(phoneVM.isLoading){
                        ForEach(0..<10) { index in
                            PhoneItemShimmer()
                        }
                    }
                    
                    ForEach(Array(zip(searchPhone.indices, phoneVM.phones)), id: \.0) { index, data in
                        NavigationLink(destination: {
                            PhoneScreen(url: data.detail)
                        }) {
                            PhoneItem(title: data.phoneName, subtitle: data.brand, urlImage: data.image)
                        }
                            .onAppear(){
                            Task {
                                do {
                                    try await phoneVM.loadMoreContent(index: index, url: url)
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        
                    }
                }.task {
                    do {
                        try await phoneVM.getPhoneByBrand(url)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
                if phoneVM.isLoadMore {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 15)
                }
            }
            .padding()
            .navigationTitle(title)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    // Search function
    var searchPhone: [Phone] {
        if searchText.isEmpty {
            phoneVM.phones
        } else {
            phoneVM.phones.filter { $0.phoneName.localizedStandardContains(searchText) }
        }
    }
}

#Preview {
    PhoneListScreen(url: "https://phone-specs-api-2.azharimm.dev/brands/apple-phones-48", title: "Apple phones")
}
