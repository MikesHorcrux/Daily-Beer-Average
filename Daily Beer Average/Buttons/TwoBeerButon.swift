//
//  TwoBeerButon.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct TwoBeerButon: View {
    @Binding var showing: Bool
    var body: some View {
        Button(action: { }) {
            ZStack{
                Card()
                HStack{
                    Image("TwoBeers")
                }
            }
           
        }
    }
}

struct TwoBeerButon_Previews: PreviewProvider {
    static var previews: some View {
        TwoBeerButon(showing: .constant(true))
    }
}
