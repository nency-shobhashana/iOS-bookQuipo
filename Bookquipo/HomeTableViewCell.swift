//
//  HomeTableViewCell.swift
//  Bookquipo
//
//  Created by Elmy on 24/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // Function to set data to book cells.
    func setBookCell(book:Books){
        bookTitle.text = book.bookName
        authorName.text = book.authorName
        bookImage.image = UIImage(named: book.bookPic)
    }
}
