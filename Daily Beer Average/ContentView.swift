//
//  ContentView.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
     @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: Beers.getBeers()) var fetchedBeers: FetchedResults<Beers>
    
    @State var showingHistory = false
    @ObservedObject var formatter = TimedateFormater()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                VStack{
                    HStack{
                        Text("Average Beers Drank: ")
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
                        Spacer()
                        Text("\(avgAmount())")
                            .fontWeight(.heavy)
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                    }
                    HStack{
                        if avgAmount() == 1{
                            Image("beerIcon")
                                .foregroundColor(.accentColor)
                        }
                        else if avgAmount() == 2{
                            Image("beerIcon")
                            .foregroundColor(.accentColor)
                            Image("beerIcon")
                            .foregroundColor(.accentColor)
                        }
                        else if avgAmount() == 3{
                            Image("beerIcon")
                            .foregroundColor(.accentColor)
                            Image("beerIcon")
                            .foregroundColor(.accentColor)
                            Image("beerIcon")
                            .foregroundColor(.accentColor)
                        }
                        else if avgAmount() == 4{
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
                .padding(.horizontal, 40)
                .padding(.bottom, 100)
                Text("Beer Log:")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
                List(_fetchedBeers.wrappedValue, id: \.self) { beer in
                    Text(" You Drank \(beer.drankBeers) Beers at \(self.formatter.timeFormatter.string(from: beer.date))")
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
    func avgAmount() -> Int16 {
        var argBeers : Int16 = 0
        
        // - average expression on the amount attribute.
        // - Naming the expression result as 'argBeers'.
        // - Assigning the expression result data type as an Int16.

        let expression = NSExpressionDescription()
        expression.expression =  NSExpression(forFunction: "average:", arguments:[NSExpression(forKeyPath: "drankBeers")])
        expression.name = "argBeers";
        expression.expressionResultType = NSAttributeType.integer16AttributeType
        
        // Step 2:
        // - Create the fetch request for the PainLevel entity.
        // - Indicate that the fetched properties are those that were
        //   described in `expression`.
        // - Indicate that the result type is a dictionary.

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Beers")
        fetchRequest.propertiesToFetch = [expression]
        fetchRequest.resultType = NSFetchRequestResultType.dictionaryResultType
        fetchRequest.predicate = predicateForDayFromDate(date: Date() as NSDate)

        // Step 3:
        // - Execute the fetch request which returns an array.
        // - There will only be one result. Get the first array
        //   element and assign to 'resultMap'.
        // - The avg amount value is in the dictionary as
        //   'Total'. This will be arg value.

        do {
            let results = try moc.fetch(fetchRequest)
            let resultMap = results[0] as! [String:Int16]
            argBeers = resultMap["argBeers"] ?? 0
        } catch let error as NSError {
            NSLog("Error when summing amounts: \(error.localizedDescription)")
        }

        return argBeers
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
