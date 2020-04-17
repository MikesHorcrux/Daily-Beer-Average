//
//  ThreeBeerButton.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ThreeBeerButton: View {
     @Environment(\.managedObjectContext) var moc
     @Binding var showing: Bool
       var body: some View {
           Button(action: {
            let Beer = Beers(context: self.moc)
            Beer.date = Date()
            Beer.drankBeers = Int16(3)
            do {
                try self.moc.save()
                print("added entry on \(Date())")
            } catch {
                print(error)
            }
            self.showing.toggle()
            print("Added 3 beer")
           }) {
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
