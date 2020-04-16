//
//  ContentView.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingHistory = false

    var body: some View {
        NavigationView{
            VStack(spacing: 150){
                HStack{
                    VStack{
                        Text("Average Beer Drank: ")
                            .font(.title)
                    }
                    Spacer()
                    Text("\(5)")
                        .fontWeight(.heavy)
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
                }
                .padding(.horizontal, 40)
                
                List {
                    Text("Beer")
                    Text("Beer")
                    Text("Beer")
                    Text("Beer")
                    Text("Beer")
                    Text("Beer")
                    Text("Beer")
                }
            }
            .padding(.vertical, 20)
        .padding()
            .navigationBarTitle("Daily Beer Average", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {self.showingHistory.toggle()}) {
                Image("beerIcon")
                .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
            } ).sheet(isPresented: $showingHistory) {
                Text("Hi Mike")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
