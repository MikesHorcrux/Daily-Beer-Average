//
//  ThreeBeerButton.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ThreeBeerButton: View {
     @Binding var showing: Bool
       var body: some View {
           Button(action: { }) {
               ZStack{
                   Card()
                HStack{
                    Image("BeerThree")
                    Image("BeerThree")
                    Image("BeerThree")
                }
                   
               }
               
           }
       }
}

struct ThreeBeerButton_Previews: PreviewProvider {
    static var previews: some View {
        ThreeBeerButton(showing: .constant(true))
    }
}
