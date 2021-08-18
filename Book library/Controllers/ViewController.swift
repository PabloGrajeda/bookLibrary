//
//  ViewController.swift
//  Book library
//
//  Created by Pablo Grajeda on 18/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var booksTableView: UITableView!
    
    var books: [BookData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showSpinner()
        //set table view
        self.setTableView()
        
        // fetch data
        self.fetchBooksData()
        
    }
    
    func setTableView() {
        self.booksTableView.isHidden = true
        self.booksTableView.dataSource = self
        
        // registering the cell created to the table view
        self.booksTableView.register(UINib(nibName: "BookViewCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        
    }
    
    func fetchBooksData() {
        BookManager.perfomRequest(with: K.API_URL) { booksData, error in
            DispatchQueue.main.async {
                self.dismissSpinner()
            }
            
            guard let books = booksData else {
                if let err = error {
                    print(err.localizedDescription)
                }
                return
            }
            
            self.books = books
            
            DispatchQueue.main.async {
                
                self.booksTableView.reloadData()
                self.booksTableView.isHidden = false
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // casting default cell as BookCell created
        let cell = booksTableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! BookViewCell
        
        //geting current book to show
        let book = books[indexPath.row]
        cell.setCell(for: book)
        
        return cell
    }
    
    
}

