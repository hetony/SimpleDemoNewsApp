//
//  MyActivityView.swift
//  SimpleNewsApp
//
//  Created by Vijesh on 03/07/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit



open class MyActivityView: UIViewController {
    
    @objc class func topWindow() -> UIWindow? {
        if let window = UIApplication.shared.keyWindow  {
            return window
        }
        return nil
    }
    
    private let activityView: UIActivityIndicatorView  = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    required public init() {
        super.init(nibName:nil, bundle:nil)
        setup()
    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
    }
    
    
    private func setup() {
        if let wnd = MyActivityView.topWindow()  {
            view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            view.alpha = 0.0
            view.frame = wnd.frame
            wnd.addSubview(view)
            
            view.addSubview(activityView)
            activityView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            activityView.widthAnchor.constraint(equalToConstant: 80).isActive = true
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            activityView.alpha = 0
            activityView.startAnimating()
        }
    }
    
    
    public func displayLoader() {
        let scale = CGAffineTransform(scaleX: 0, y: 0)
        activityView.transform = scale
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .curveEaseInOut, animations: {
            self.view.alpha = 0.8
            self.activityView.alpha = 1
            self.activityView.transform = .identity
        }) { (finished) in
        }
    }
    
    
    public func dismissLoader() {
        activityView.stopAnimating()
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 0
        }, completion: { finished in
            self.view.removeFromSuperview()
        })
    }
    
    
    deinit {
        print("deleted activity view")
    }
    
    
}


