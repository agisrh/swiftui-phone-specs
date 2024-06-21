//
//  PopularScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 21/06/24.
//

import SwiftUI

struct PopularScreen: View {
    
    @StateObject var popularVM = PopularViewModel(apiService: APIService.shared)
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                if(popularVM.isLoading){
                    Spinner()
                }
                
                VStack {
                    List(Array(zip(searchPopularPhone.indices, popularVM.response.data.phones)), id: \.0) {index, data in
                        NavigationLink(destination: {
                            PhoneScreen(url: data.detail)
                        }) {
                            HStack(alignment: .center) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color("ColorGreen").opacity(0.20))
                                        .frame(width: 35, height: 35)
                                    
                                    Text("\(index+1)")
                                        .foregroundColor(Color("ColorGreen"))
                                        .font(Font.system(size: 15))
                                }
                                VStack(alignment: .leading) {
                                    Text(data.phoneName).padding(.bottom, 0.5)
                                    Text("\(data.favorites) Liked")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("ColorGreen"))
                                }.padding(.leading, 5)
                            }
                        }
                    }.task {
                        do {
                            try await popularVM.getPopularPhone()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    .listStyle(.plain)
                }
                .searchable(text: $searchText)
                .navigationTitle("Most Favorite by Fans")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    // Search
    var searchPopularPhone: [Popular]{
        if(searchText.isEmpty){
            popularVM.response.data.phones
        }else{
            popularVM.response.data.phones.filter { $0.phoneName.localizedStandardContains(searchText) }
        }
    }
}

#Preview {
    PopularScreen()
}
