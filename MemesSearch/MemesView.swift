//
//  MemesView.swift
//  MemesSearch
//
//  Created by Drolllted on 05.06.2024.
//

import UIKit

class MemesView: UIView {
    
    //MARK: - Properties
    private let anchor: CGFloat = 15
    
    //MARK: - UI Models
    
    lazy var questionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "What's your questions?"
        textField.borderStyle = .line
        textField.font = .systemFont(ofSize: 18, weight: .bold)
        textField.backgroundColor = .gray
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.textColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()
    
    lazy var memesImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.backgroundColor = .lightGray
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        return image
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.backgroundColor = UIColor.green
        button.tintColor = .yellow
        button.layer.cornerRadius = 10
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return button
    }()
    
    lazy var dislikeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dislike"), for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return button
    }()
    
    
    //MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setQuestionTextField()
        
        setSearchButton()
        
        setMemesImage()
        
        setLikeButton()
        
        setDislikeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setQuestionTextField() {
        addSubview(questionTextField)
        
        NSLayoutConstraint.activate([
            questionTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: anchor),
            questionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            questionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setSearchButton() {
        addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: self.questionTextField.bottomAnchor, constant: anchor),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setMemesImage() {
        addSubview(memesImage)
        
        NSLayoutConstraint.activate([
            memesImage.topAnchor.constraint(equalTo: self.searchButton.bottomAnchor, constant: anchor),
            memesImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            memesImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setLikeButton() {
        addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: memesImage.bottomAnchor, constant: 20),
            likeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
        
        ])
    }
    
    private func setDislikeButton() {
        addSubview(dislikeButton)
        
        NSLayoutConstraint.activate([
            dislikeButton.topAnchor.constraint(equalTo: memesImage.bottomAnchor, constant: 20),
            dislikeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
}
