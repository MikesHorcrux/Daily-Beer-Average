//
//  OneBeerButton.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct OneBeerButton: View {
    @Binding var showing: Bool
    var body: some View {
        Button(action: { }) {
            ZStack{
                Card()
            }
        }
    }
}

struct OneBeerButton_Previews: PreviewProvider {
    static var previews: some View {
        OneBeerButton(showing: .constant(true))
    }
}
