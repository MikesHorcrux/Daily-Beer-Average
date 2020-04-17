//
//  FourBeerButton.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct FourBeerButton: View {
     @Binding var showing: Bool
       var body: some View {
           Button(action: { }) {
               ZStack{
                   Card()
                   HStack{
                       Image("BeerFour")
                       Image("BeerFour")
                   }
               }
              
           }
       }
}

struct FourBeerButton_Previews: PreviewProvider {
    static var previews: some View {
        FourBeerButton(showing: .constant(true))
    }
}
