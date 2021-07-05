//
//  CalendarVars.swift
//  TodoCalender
//
//  Created by kuet on 23/10/19.
//  Copyright © 2019 kuet. All rights reserved.
//

import Foundation

var date = Date()
var calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)

