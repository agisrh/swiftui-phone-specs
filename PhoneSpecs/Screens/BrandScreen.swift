//
//  BrandScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 10/06/24.
//

import SwiftUI

struct BrandScreen: View {
    
    @StateObject var brandVM = BrandViewModel(apiService: APIService.shared)
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Loading animation
                if(brandVM.isLoading){
                    Spinner()
                }
                // List brand
                VStack {
                    List(searchBrand) { brand in
                        NavigationLink(destination: {
                            PhoneListScreen(url: brand.detail, title: brand.brandName)
                        }) {
                            HStack(alignment: .center) {
                                Text(brand.brandName)
                                Spacer()
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color("ColorGreen").opacity(0.20))
                                        .frame(width: 25, height: 25)
                                    
                                    Text("\(brand.deviceCount)")
                                        .foregroundColor(Color("ColorGreen"))
                                        .font(Font.system(size: 10))
                                }
                            }
                        }
                    }.task {
                        do {
                            try await brandVM.getBrands()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    .listStyle(.plain)
                }
                .searchable(text: $searchText)
                .navigationTitle("Brand")
            }
        }
    }
    
    // Search function
    var searchBrand: [Brand] {
        if searchText.isEmpty {
            brandVM.brandResponse.brands
        } else {
            brandVM.brandResponse.brands.filter { $0.brandName.localizedStandardContains(searchText) }
        }
    }
}
