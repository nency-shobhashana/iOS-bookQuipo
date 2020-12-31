//
//  BookmarkViewController.swift
//  Bookquipo
//
//  Created by Nency Shobhashana on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    var bookList = [Books]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.intialSetup()
    }
    
    // load and configure data of table
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.fillData()
        homeTableView.reloadData()
    }
    
    // transfer book object to book detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookDetailVC = segue.destination as? BookDetailViewController, let book = sender as? Books {
            bookDetailVC.book = book
        }
    }
}

extension BookmarkViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    // remove book from list, store in UserManager and reload table view
    func removeBook(book: Books){
        let at = bookList.firstIndex { (bookmarkBook) -> Bool in
            bookmarkBook.bookName == book.bookName
        }
        
        if at != nil {
            bookList.remove(at: at!)
            UserDefaultManager.shared.bookmarkData = bookList
            homeTableView.reloadData()
        }
    }
    
    // configure table cell from list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkTableViewCell", for: indexPath) as! BookmarkTableViewCell
        cell.setBookCell(book: bookList[indexPath.row], removeBook: removeBook)
        return cell
    }
    
    // move to Book detail view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookList[indexPath.row]
        self.performSegue(withIdentifier: "BookmarkToDetailView", sender: book)
    }
}

extension BookmarkViewController {
    
    // set tableview delegate and datasource
    func intialSetup()  {
         homeTableView.delegate = self
         homeTableView.dataSource = self
         fillData()
         homeTableView.tableFooterView = UIView()
    }
    
    // fill data from UserDefaultManager bookmark data
    func fillData() {
        bookList = UserDefaultManager.shared.bookmarkData ?? []
    }
}
