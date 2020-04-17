//
//  TimedateFormater.swift
//  Daily Beer Average
//
//  Created by Mike Van Amburg on 4/16/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//


import SwiftUI
import Foundation

final class TimedateFormater: ObservableObject{
    var dateFormatter: DateFormatter {
      let formatter = DateFormatter()
        formatter.dateStyle = .medium
      return formatter
    }
    var timeFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
}
