//
//  PhoneItem.swift
//  PhoneSpecs
//
//  Created by Agis on 12/06/24.
//

import SwiftUI

struct PhoneItem: View {
    var title: String
    var subtitle: String?
    var urlImage: String
    
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .fill(Color("ColorBackgroundGrey"))
                .frame(width: 156, height: 242)
                .cornerRadius(10)
                .padding(0.5)
                .background(.gray.opacity(0.20))
                .cornerRadius(10)
            
            VStack{
                AsyncImage(url: URL(string: urlImage)) { image in
                    image.resizable().scaledToFit().frame(width: 125, height: 150)
                     } placeholder: {
                         ContainerRelativeShape()
                             .fill(.gray.opacity(0.10)).frame(width: 125, height: 150)
                             .cornerRadius(5)
                     }
                
                HStack {
                    VStack(alignment: .leading){
                        Text(title).font(.system(size:12)).padding(.leading, 15)
                        
                        if(subtitle != nil) {
                            Text(subtitle!)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .foregroundColor(Color("ColorGreen"))
                                .background(Color("ColorGreen").opacity(0.20))
                                .font(.system(size: 10))
                                .cornerRadius(8)
                                .padding(.trailing, 8)
                                .padding(.bottom, 8)
                                .padding(.leading, 15)
                        }
                    }
                    Spacer()
                }.padding(.top, 5)
                
            }.padding()
        }
    }
}
