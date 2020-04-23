//
//  Beers.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import CoreData

class Beers: NSManagedObject {
    @NSManaged var date: Date
    @NSManaged var drankBeers: Int16
}
extension Beers {
    static func getBeers() -> NSFetchRequest<Beers> {
        
        let request = Beers.fetchRequest() as! NSFetchRequest<Beers>
       
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        // Get the current calendar with local time zone
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local

        // Get today's beginning & end
        let dateFrom = calendar.startOfDay(for: Date()) // eg. 2016-10-10 00:00:00
        let dateTo = calendar.date(byAdding: .day, value: 1, to: dateFrom)
        // Note: Times are printed in UTC. Depending on where you live it won't print 00:00:00 but it will work with UTC times which can be converted to local time

        // Set predicate as date being today's date
        let fromPredicate = NSPredicate(format: "date >= %@", dateFrom as NSDate)
        let toPredicate = NSPredicate(format: "date < %@", dateTo! as NSDate)
        let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
        request.predicate = datePredicate
        return request
    }
    
   
}
