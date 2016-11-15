//
//  info.swift
//  Lab4
//
//  Created by Labuser on 10/13/16.
//  /Users/Labuser/Desktop/InClassDemo2/InClassDemo2/SwiftyJSON.swiftCopyright © 2016 wustl. All rights reserved.
//

import Foundation

struct Info {
    var name: String
    var description: String
    var url: String
    var id : String
    var year : String
    var rated : String
    var score : String
    
    
    init(name: String, description: String, url: String, year: String, id: String, rated: String, score: String){
        self.name = name
        self.description = description
        self.url = url
        self.year = year
        self.id = id
        self.rated = rated
        self.score = score
    }
}