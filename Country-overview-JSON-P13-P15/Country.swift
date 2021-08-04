//
//  country.swift
//  Country-overview-JSON-P13-P15
//
//  Created by Łukasz Nycz on 04/08/2021.
//

import Foundation

struct Country:Codable {
    var country:[CountryContains]
    
}

struct CountryContains: Codable {
    var name:String
    var description:String
    var currency: String
    var population: Double
    var funFact:String
}
