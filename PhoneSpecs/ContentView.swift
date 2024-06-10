//
//  ContentView.swift
//  PhoneSpecs
//
//  Created by Agis on 07/06/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        BottomBar()
        //.environment(\.colorScheme, .dark)
    }
}

struct BottomBar: View {
    var body: some View {
        TabView{
            HomeScreen().tabItem {
                Image(systemName: "house");
                Text("Home")
            }
            BrandScreen().tabItem {
                Image(systemName: "iphone.sizes");
                Text("Brand")
            }
            PopularScreen().tabItem {
                Image(systemName: "flame");
                Text("Popular")
            }
            HomeScreen().tabItem {
                Image(systemName: "person.circle");
                Text("Account")
            }
        }.accentColor(Color("ColorPrimary"))
    }
}

#Preview {
    ContentView()
        .environmentObject(Providers(apiService:APIService.shared))
}
