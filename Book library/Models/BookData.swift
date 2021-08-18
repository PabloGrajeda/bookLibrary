//
//  BookData.swift
//  Book library
//
//  Created by Pablo Grajeda on 18/08/21.
//

import Foundation

struct BookData: Decodable {
    let title: String
    let imageURL: String?
}
