//
//  InterestScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import SwiftUI

struct InterestScreen: View {
    
    @StateObject var interestVM = InterestViewModel(apiService: APIService.shared)
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                if(interestVM.isLoading){
                    Spinner()
                }
                
                VStack {
                    List(Array(zip(searchInterestPhone.indices, interestVM.response.data.phones)), id: \.0) {index, data in
                        NavigationLink(destination: {
                            PhoneScreen(url: data.detail)
                        }) {
                            HStack(alignment: .center) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.colorGreen.opacity(0.20))
                                        .frame(width: 35, height: 35)
                                    
                                    Text("\(index+1)")
                                        .foregroundColor(.colorGreen)
                                        .font(Font.system(size: 15))
                                }
                                VStack(alignment: .leading) {
                                    Text(data.phoneName).padding(.bottom, 0.5)
                                    Text("\(data.hits) Hits")
                                            .font(.system(size: 15))
                                            .foregroundColor(.colorGreen)
                                }.padding(.leading, 5)
                            }
                        }
                    }.task {
                        do {
                            try await interestVM.getInterestPhone()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    .listStyle(.plain)
                }
                .searchable(text: $searchText)
                .navigationTitle("Most Daily Interest")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    // Search
    var searchInterestPhone: [Interest]{
        if(searchText.isEmpty){
            interestVM.response.data.phones
        }else{
            interestVM.response.data.phones.filter { $0.phoneName.localizedStandardContains(searchText) }
        }
    }
}

#Preview {
    InterestScreen()
}
