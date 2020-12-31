//
//  BookmarkTableViewCell.swift
//  Bookquipo
//
//  Created by Nency Shobhashana on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!

    var removeBook: ((Books) -> Void)? = nil
    var book: Books? = nil
    
    // set image and text of book in bookmark table cell
    func setBookCell(book:Books, removeBook: @escaping (Books) -> Void ){
        self.book = book
        self.removeBook = removeBook
        bookTitle.text = book.bookName
        authorName.text = book.authorName
        bookImage.image = UIImage(named: book.bookPic)
    }
    
    // invoke remove book method on click of remove button
    @IBAction func removeClicked(_ sender: Any) {
        if book != nil {
            removeBook?(book!)
        }
    }
}
