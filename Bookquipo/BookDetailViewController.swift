//
//  BookDetailViewController.swift
//  Bookquipo
//
//  Created by mandeep kaur on 25/11/20.
//  Copyright © 2020 mandeep. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var txtViewBook: UITextView!

    // Variables
    var book: Books?

    override func viewDidLoad() {
        super.viewDidLoad()
        // setting the selected data from home page to detail page
        if let book = book {
            self.setUpNavBar(book.bookName)
            imageViewBook.image = UIImage(named: book.bookPic)
            txtViewBook.text = book.bookSummary
        }
    }
    
    // Setting navigation and tab bar
    func setUpNavBar(_ title: String){
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = title
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // segue function to move to show more page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let bookMoreDetailVC = segue.destination as? BookMoreDetailViewController, let book = book {
               bookMoreDetailVC.book = book
           }
       }
    
    // Actions
    // Bookmark button action
    @IBAction func BookmarkButtonAction(_ sender: UIBarButtonItem) {
        if let books = UserDefaultManager.shared.bookmarkData {
            let bookmarkContain = books.contains(where: { (data) -> Bool in
                data.bookName == book?.bookName
            })
            if(bookmarkContain){
                showToast(message: "This book is already bookmarked.", font: .systemFont(ofSize: 12.0))
            } else {
                showToast(message: "Bookmarked", font: .systemFont(ofSize: 12.0))
                UserDefaultManager.shared.bookmarkData?.append(book!)
            }
        } else {
            showToast(message: "Bookmarked", font: .systemFont(ofSize: 12.0))
            UserDefaultManager.shared.bookmarkData = [book!]
        }
    }
}
