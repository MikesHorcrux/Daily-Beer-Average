//
//  ContentView.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Beers.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) var fetchedBeers: FetchedResults<Beers>
    
    @State var showingHistory = false

    var body: some View {
        NavigationView{
            VStack(spacing: 100){
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
                
                List(_fetchedBeers.wrappedValue, id: \.self) { beer in
                    Text(" You Drank \(beer.drankBeers) at \(beer.date)")
                        .padding(.vertical)
                }
            }
            .padding(.vertical, 20)
        .padding()
            .navigationBarTitle("Daily Beer Average", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {self.showingHistory.toggle()}) {
                Image("beerIcon")
                .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
            } ).sheet(isPresented: $showingHistory) {
                EntryView(showing: self.$showingHistory).environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func predicateForDayFromDate(date: NSDate) -> NSPredicate {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var components = calendar!.components([.year, .month, .day, .hour, .minute, .second], from: date as Date)
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar!.date(from: components)
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar!.date(from: components)

        return NSPredicate(format: "date >= %@ AND date =< %@", argumentArray: [startDate!, endDate!])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
