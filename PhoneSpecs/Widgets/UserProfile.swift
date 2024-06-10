//
//  UserProfile.swift
//  PhoneSpecs
//
//  Created by Agis on 07/06/24.
//

import Foundation
import SwiftUI

struct UserProfile: View {
    var width: CGFloat = 24
    var height: CGFloat = 24
    var fontSize: CGFloat = 12
    var backgroundColor: Color = Color.blue
    var foregroundColor: Color = Color.white
    var initial: String?
    var image: String?
    var body: some View {
        
        // image user
        if(initial==nil && image != nil){
            Image(image!)
                .resizable()
                .frame(width: width, height: height)
                .clipShape(Circle())
            
        // initial user
        }else if(initial != nil && image == nil){
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: width, height: height)
                Text(initial!)
                    .font(.system(size: fontSize))
                    .foregroundColor(.white)
            }
            
        // default initial
        } else {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: width, height: height)
                Text("A")
                    .font(.system(size: fontSize))
                    .foregroundColor(.white)
            }
        }
    }
}
