//
//  CardTwo.swift
//  
//
//  Created by Mike  Van Amburg on 3/30/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct CardTwo: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
        .fill(Color("BackgroundCard"))
        .frame(width: nil, height: 150)
        .shadow(color: Color("LightShadow"), radius: 10, x: -5, y: -4)
        .shadow(color: Color("DarkShadow"), radius: 10, x: 10, y: 10)
    }
}

struct CardTwo_Previews: PreviewProvider {
    static var previews: some View {
        CardTwo()
    }
}
