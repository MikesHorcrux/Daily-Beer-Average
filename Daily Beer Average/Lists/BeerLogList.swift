//
//  BeerLogList.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 5/5/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct BeerLogList: View {
    @FetchRequest(fetchRequest: Beers.getBeers()) var fetchedBeers: FetchedResults<Beers>
    @ObservedObject var formatter = TimedateFormater()
    
    var body: some View {
        VStack{
            Text("Beer Log:")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
            List(_fetchedBeers.wrappedValue, id: \.self) { beer in
                Text(" You Drank \(beer.drankBeers) Beers at \(self.formatter.timeFormatter.string(from: beer.date))")
                    .padding(.vertical)
            }
        }
    }
}

struct BeerLogList_Previews: PreviewProvider {
    static var previews: some View {
        BeerLogList()
    }
}
