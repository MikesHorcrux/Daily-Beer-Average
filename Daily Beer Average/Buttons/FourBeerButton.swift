//
//  FourBeerButton.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct FourBeerButton: View {
     @Environment(\.managedObjectContext) var moc
     @Binding var showing: Bool
       var body: some View {
           Button(action: {
            let Beer = Beers(context: self.moc)
            Beer.date = Date()
            Beer.drankBeers = Int16(4)
            do {
                try self.moc.save()
                print("added entry on \(Date())")
            } catch {
                print(error)
            }
            self.showing.toggle()
            print("Added 4 beer")
           }) {
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
