//
//  BookManager.swift
//  Book library
//
//  Created by Pablo Grajeda on 18/08/21.
//

import Foundation

struct BookManager {
    typealias completionHandler = ([BookData]?, Error?) -> Void
    
    // function that will help to decode de data comming from internet
    private static func parseJSON(_ bookData: Data) -> [BookData]? {
        
        let decoder = JSONDecoder()
        
        do  {
            let decodedBookData = try decoder.decode([BookData].self, from: bookData)
            return decodedBookData
        } catch {
            print(error)
            return nil
        }
    }
    
    // function that will fetch data from internet
    static func perfomRequest(with urlString: String, completion: @escaping completionHandler) {
        
        // create an URL object from string
        guard let url = URL(string: urlString) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // if cannot get data, there was an error
            guard let bookData = data else {
                completion(nil, error)
                return
            }
            
            // parsing data comming from internet to a bookData object
            if let books = self.parseJSON(bookData) {
                completion(books, nil)
            }
            
        }
        
        task.resume()
    }
}
