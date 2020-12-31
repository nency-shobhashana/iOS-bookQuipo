//
//  Books.swift
//  Bookquipo
//
//  Created by Elmy on 24/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import Foundation

class Books : Codable {
    
    var category:String
    var bookName:String
    var authorName:String
    var bookSummary:String
    var bookDetails:String
    var bookPrice:Double
    var bookPic:String
    
    init(category:String, name:String, author:String, summary:String, details:String, price:Double, pic:String) {
        self.category = category
        self.bookName = name
        self.authorName = author
        self.bookSummary = summary
        self.bookDetails = details
        self.bookPrice = price
        self.bookPic = pic
    }
}
