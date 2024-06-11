//
//  Spinner.swift
//  PhoneSpecs
//
//  Created by Agis on 11/06/24.
//

import SwiftUI

struct Spinner: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle())
      .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
  }
}
