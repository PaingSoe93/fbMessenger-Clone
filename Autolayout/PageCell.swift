//
//  PageCell.swift
//  Autolayout
//
//  Created by Paing Aung on 6/26/18.
//  Copyright © 2018 Paing Aung. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page : Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n \(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bear_first")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionTextView : UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun?\n Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        //        textView.text = "Join us today in our fun and games!"
        //        textView.font = UIFont.boldSystemFont(ofSize: 18)
        
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let topImageContainerView = UIImageView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageContainerView)
        
        topImageContainerView.addSubview(bearImageView)
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
