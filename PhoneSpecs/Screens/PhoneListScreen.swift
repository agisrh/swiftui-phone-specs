//
//  PhoneListScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import SwiftUI

struct PhoneListScreen: View {
    
    @StateObject var phoneVM = PhoneViewModel(apiService: APIService.shared)
    let url: String
    let title: String
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ZStack {
            // Loading animation
            if(phoneVM.isLoading){
                Spinner()
            }
            // List Phone
            ScrollView{
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(phoneVM.phones) { data in
                        Text(String(data.phoneName))
                            .frame(width: 150, height: 150, alignment: .center)
                            .background(.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }.onAppear(){
                    phoneVM.loadMoreContent()
                    Task {
                        do {
                            try await phoneVM.getPhoneByBrand(url)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(title)
        }
    }
}
