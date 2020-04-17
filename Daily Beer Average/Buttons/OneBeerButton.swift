//
//  OneBeerButton.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct OneBeerButton: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var showing: Bool
    var body: some View {
        Button(action: {
            let Beer = Beers(context: self.moc)
            Beer.date = Date()
            Beer.drankBeers = Int16(1)
            do {
                try self.moc.save()
                print("added entry on \(Date())")
            } catch {
                print(error)
            }
            self.showing.toggle()
            print("Added one beer")
        }) {
            ZStack{
                Card()
                Image("Beer")
            }
            
        }
    }
}

struct OneBeerButton_Previews: PreviewProvider {
    static var previews: some View {
        OneBeerButton(showing: .constant(true))
    }
}
