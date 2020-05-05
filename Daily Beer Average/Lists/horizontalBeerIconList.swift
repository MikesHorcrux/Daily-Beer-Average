//
//  horizontalBeerIconList.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 5/5/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct horizontalBeerIconList: View {
    @State var avg: Int
    var body: some View {
        HStack{
            if avg == 1{
                Image("beerIcon")
                    .foregroundColor(.accentColor)
            }
            else if avg == 2{
                Image("beerIcon")
                .foregroundColor(.accentColor)
                Image("beerIcon")
                .foregroundColor(.accentColor)
            }
            else if avg == 3{
                Image("beerIcon")
                .foregroundColor(.accentColor)
                Image("beerIcon")
                .foregroundColor(.accentColor)
                Image("beerIcon")
                .foregroundColor(.accentColor)
            }
            else if avg == 4{
                Image("beerIcon")
                .foregroundColor(.accentColor)
                Image("beerIcon")
                .foregroundColor(.accentColor)
                Image("beerIcon")
                .foregroundColor(.accentColor)
                Image("beerIcon")
                .foregroundColor(.accentColor)
            }
            else{
               Image(systemName: "ellipsis")
            }
        }
    }
}

struct horizontalBeerIconList_Previews: PreviewProvider {
    static var previews: some View {
        horizontalBeerIconList(avg: 1)
    }
}
