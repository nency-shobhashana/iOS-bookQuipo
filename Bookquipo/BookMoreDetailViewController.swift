//
//  BookMoreDetailViewController.swift
//  Bookquipo
//
//  Created by mandeep kaur on 25/11/20.
//  Copyright © 2020 mandeep. All rights reserved.
//

import UIKit

class BookMoreDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var txtViewBook: UITextView!
    
    var book: Books?

    override func viewDidLoad() {
        super.viewDidLoad()
        // showing the detailed data oof a book in textview
        txtViewBook.text = book?.bookDetails
    }

}
