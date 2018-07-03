//
//  NewsItemCell.swift
//  SimpleNewsApp
//
//  Created by Vijesh on 03/07/18.
//  Copyright © 2018 Home. All rights reserved.
//


import UIKit

class NewsItemCell: UICollectionViewCell {
    
    var newsModel: NewsModel? {
        didSet {
            if let title = newsModel?.title {
                titleLabel.text = title
            }
            
            if let subTitle = newsModel?.byline {
                subTitleLabel.text = subTitle
            }
            
            if let publishedDate = newsModel?.publishedDate {
                dateLabel.text = publishedDate
            }
        }
    }
    
    
    let iconView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let disclosureView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "disclosure")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
        
        
        //contentView.backgroundColor = .purple
        
        
        contentView.addSubview(disclosureView)
        disclosureView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        disclosureView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        disclosureView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        disclosureView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(iconView)
        iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(titleLabel)
        //titleLabel.backgroundColor = .blue
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: disclosureView.leadingAnchor, constant: -10).isActive = true
        
        contentView.addSubview(subTitleLabel)
        //subTitleLabel.backgroundColor = .blue
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        
        contentView.addSubview(dateLabel)
        //dateLabel.backgroundColor = .blue
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        
        contentView.addSubview(dateIconImageView)
        dateIconImageView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor, constant: 0).isActive = true
        dateIconImageView.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -5).isActive = true
        dateIconImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        dateIconImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        
        
    }
    
    
    
    override var isSelected: Bool {
        didSet {
            //contentView.backgroundColor = isSelected ? UIColor.lightGray : UIColor.basicTextColor
            
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentView.backgroundColor = isHighlighted ? UIColor.rgb(red: 220, green: 220, blue: 220) : UIColor.clear
            //selectImageView.image = isSelected ? UIImage(named: "selected") : UIImage(named: "unselected")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




