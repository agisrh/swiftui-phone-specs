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
            VStack {
            
            }.navigationBarItems(
                leading: HStack{
                    UserProfile(width: 40, height: 40, image: "profile")
                    VStack(alignment: .leading) {
                        Text("John Doe").font(.system(size: 14)).fontWeight(.semibold)
                        Text("johndoe@mail.com").font(.system(size: 12))
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

//#Preview {
//    HomeScreen().environmentObject(Providers(apiService: APIService.shared))
//}
