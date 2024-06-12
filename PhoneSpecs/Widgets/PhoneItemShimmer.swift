//
//  PhoneItemShimmer.swift
//  PhoneSpecs
//
//  Created by Agis on 12/06/24.
//

import SwiftUI

struct PhoneItemShimmer: View {
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .fill(Color("ColorBackgroundGrey"))
                .frame(width: 156, height: 242)
                .padding(1)
                .background(.gray.opacity(0.20))
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                
                ContainerRelativeShape()
                    .fill(.gray.opacity(0.10))
                    .frame(width: 125, height: 150)
                    .cornerRadius(5)
                
                VStack{
                    ContainerRelativeShape()
                        .fill(.gray.opacity(0.10))
                        .frame(width: 100, height: 20)
                        .cornerRadius(5)
                    
                    ContainerRelativeShape()
                        .fill(.gray.opacity(0.10))
                        .frame(width: 100, height: 20)
                        .cornerRadius(5)
                }.padding(.top, 5)
                
            }.padding()
        }
    }
}

#Preview {
    PhoneItemShimmer()
}
