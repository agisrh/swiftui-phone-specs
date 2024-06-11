//
//  InterestScreen.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import SwiftUI

struct InterestScreen: View {
    
    @StateObject var interestVM = InterestViewModel(apiService: APIService.shared)
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                ForEach(interestVM.response.data.phones) { data in
                    Text(String(data.phoneName))
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                    
                }
            }.onAppear(){
                Task {
                    do {
                        try await interestVM.getInterestPhone()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
        } .padding()
    }
}

#Preview {
    InterestScreen()
}
