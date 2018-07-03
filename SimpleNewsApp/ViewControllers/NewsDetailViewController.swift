//
//  NewsDetailViewController.swift
//  SimpleNewsApp
//
//  Created by Vijesh on 03/07/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var newsModel: NewsModel?
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailTitle: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = UIColor.gray
        textView.textAlignment = .left
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.rgb(red: 248, green: 248, blue: 248)
        
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
       
        view.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        
        view.addSubview(dateIconImageView)
        dateIconImageView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor, constant: 0).isActive = true
        dateIconImageView.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -5).isActive = true
        dateIconImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        dateIconImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(detailTitle)
        detailTitle.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        detailTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        detailTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        detailTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        
        if newsModel != nil {
            titleLabel.text = newsModel?.title
            detailTitle.text = newsModel?.abstract
            dateLabel.text = newsModel?.publishedDate
        }
        
    }

    

}
