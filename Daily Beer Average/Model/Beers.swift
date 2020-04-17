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
        return request
    }
    
   
}
