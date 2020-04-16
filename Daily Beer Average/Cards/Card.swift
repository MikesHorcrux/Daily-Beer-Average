//
//  Card.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI


        struct Card: View {
            var body: some View {
                RoundedRectangle(cornerRadius: 25)
                .fill(Color("BackgroundCard"))
                .frame(width: 180, height: 180)
                .shadow(color: Color("LightShadow"), radius: 10, x: -5, y: -4)
                .shadow(color: Color("DarkShadow"), radius: 10, x: 10, y: 10)
            }
        }

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
