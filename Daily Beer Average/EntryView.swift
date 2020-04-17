//
//  EntryView.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct EntryView: View {
     @Environment(\.managedObjectContext) var moc
     @Binding var showing: Bool
    var body: some View {
        VStack(spacing: 50){
            VStack(alignment: .leading){
                Text("How many Beers did you just Drink?")
                    .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
                    .fontWeight(.medium)
                    .font(.title)
                    .padding(.leading, -20)
            }
            HStack{
                OneBeerButton(showing: $showing)
                    .padding(.trailing)
                TwoBeerButon(showing: $showing)
                    .padding(.leading)
                
                
            }
            HStack{
               ThreeBeerButton(showing: $showing)
                .padding(.trailing)
                FourBeerButton(showing: $showing)
                    .padding(.leading)
            }
            Spacer()
        }
        .padding(20)
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(showing: .constant(true))
    }
}
