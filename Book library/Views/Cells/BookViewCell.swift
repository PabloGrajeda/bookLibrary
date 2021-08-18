//
//  BookViewCell.swift
//  Book library
//
//  Created by Pablo Grajeda on 18/08/21.
//

import UIKit

class BookViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(for book: BookData) {
        self.bookTitleLabel.text = book.title
        
        // Trying to fetch image from URL
        if let imageURL = book.imageURL {
            guard let  bookImageURL = URL(string: imageURL) else {
                return
            }
            guard let imageData = try? Data(contentsOf: bookImageURL) else {
                return
            }
            guard let image = UIImage(data: imageData) else {
                return
            }

            // Set image after fetching its data from URL
            self.bookImageView.image = image
        }
    }
    
}
