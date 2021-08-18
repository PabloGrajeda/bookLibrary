//
//  Extensions.swift
//  Book library
//
//  Created by Pablo Grajeda on 18/08/21.
//

import UIKit

var aView: UIView?

extension ViewController {
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView!.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.0)
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.center = aView!.center
        activityIndicator.startAnimating()
        aView!.addSubview(activityIndicator)
        self.view.addSubview(aView!)
    }
    
    func dismissSpinner() {
        aView?.removeFromSuperview()
        aView =  nil
    }
}
