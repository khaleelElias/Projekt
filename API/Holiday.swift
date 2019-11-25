//
//  Holiday.swift
//  API
//
//  Created by Fahed Yousif on 2019-11-25.
//  Copyright © 2019 khaleel Elias. All rights reserved.
//

import Foundation

//this is where we create our data model

/*
 the response is a structure of the other structs maps to the information to the response that we get from our API.
 */

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetails]
}

//sotrage of name and date
struct HolidayDetails: Decodable {
    var name: String
    var date: DateInfo
}

struct DateInfo: Decodable {
    var iso: String
}
