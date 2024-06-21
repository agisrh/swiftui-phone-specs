//
//  HomeScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 07/06/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                LatestDevices()
            }.navigationBarItems(
                leading: HStack{
                    Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.colorGreen)
                    VStack(alignment: .leading) {
                        Text("PHONE")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.colorGreen)
                        Text("SPESIFICATION")
                            .font(.system(size: 12))
                            .tracking(1.5)
                            .foregroundColor(.gray)
                    }
                },
                trailing: HStack(spacing: 18){
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "heart")
                }
            )
        }
    }
}

struct LatestDevices: View {
    @StateObject var latestVM = LatestViewModel(apiService: APIService.shared)
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 156))
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading) {
                Text("Latest Devices")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 15)
                    .padding(.top, 50)
                .padding(.bottom, 10)
            }.frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                // Loading
                if(latestVM.isLoading){
                    ForEach(0..<10) { index in
                        PhoneItemShimmer()
                    }
                }
                
                ForEach(latestVM.response.data.phones, id: \.id) {
                    data in
                    NavigationLink(destination: {
                        PhoneScreen(url: data.detail)
                    }) {
                        PhoneItem(title: data.phoneName, urlImage: data.image)
                    }
                }
            }.task {
                do {
                    try await latestVM.getLatestPhone()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//#Preview {
//    HomeScreen().environmentObject(Providers(apiService: APIService.shared))
//}
