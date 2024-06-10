//
//  BrandScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 10/06/24.
//

import SwiftUI

struct BrandScreen: View {
    
    @EnvironmentObject var providers: Providers
    //@State private var listBrand: [Brand] = []
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(listBrand, id: \.self) { brand in
                    NavigationLink(destination: Text("Test")) {
                        Text(brand)
                    }
                }.task {
                    do {
                        try await providers.getBrands()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                .listStyle(.plain)
            }
            .searchable(text: $searchText).onChange(of: searchText) { oldData, newData in
                //updateFilteredFavorites(search)
            }
            .navigationTitle("Brands")
        }
    }
    
//    func updateFilteredFavorites(_ searchText: String) {
//        if searchText == "" {
//            listBrand =
//            return
//        }
//        
//        var temp = myFavorites
//        for i in temp.indices {
//            temp[i].elements = temp[i].elements.filter { $0.name.localizedStandardContains(searchText) }
//        }
//        // Remove the empty sections
//        favorites = temp.filter { !$0.elements.isEmpty }
//    }
//    
    // Filter countries
    var listBrand: [String] {
        // Make brand lowercased
        let listOfBrand = providers.brandResponse.brands.map { $0.brandName.lowercased() }
        
        return searchText == "" ? listOfBrand : listOfBrand.filter { $0.contains(searchText.lowercased()) }
    }
}

#Preview {
    BrandScreen().environmentObject(Providers(apiService: APIService.shared))
}
