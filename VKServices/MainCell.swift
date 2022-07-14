//
//  MainCell.swift
//  VKServices
//
//  Created by juliemoorled on 13.07.2022.
//

import UIKit

class MainCell: UITableViewCell {
    
    var serviceLink = String()
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let pictureImageView = UIImageView()
    let iconImageView = UIImageView(image: UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .regular, scale: .medium)))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        
        configureImage()
        configureNameLabel()
        configureDescriptionLabel()
        configureIcon()
        
    }
    
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        super.setHighlighted(highlighted, animated: animated)
//        if highlighted {
//            backgroundColor = .darkGray
//        } else {
//            backgroundColor = .black
//        }
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            backgroundColor = .darkGray
            guard let url = URL(string: serviceLink) else { return }
            UIApplication.shared.open(url)
        } else {
            backgroundColor = .black
        }
    }
    
    func setData(service: Service) {
        nameLabel.text = service.name
        descriptionLabel.text = service.description
        pictureImageView.downloaded(from: service.icon_url)
        serviceLink = service.link
    }
    
    func configureImage() {
        self.addSubview(pictureImageView)
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pictureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            pictureImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            pictureImageView.heightAnchor.constraint(equalToConstant: 60),
            pictureImageView.widthAnchor.constraint(equalTo: pictureImageView.heightAnchor)
        ])
        pictureImageView.image = UIImage(named: "error.png")
    }
    
    func configureNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
        nameLabel.text = "Loading..."
        nameLabel.textAlignment = .left 
        nameLabel.textColor = .white
        nameLabel.font = nameLabel.font.withSize(15)
    }
    
    func configureDescriptionLabel() {
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7)
        ])
        descriptionLabel.textAlignment = .left
        descriptionLabel.text = "Please try reload app"
        descriptionLabel.textColor = .white
        descriptionLabel.font = descriptionLabel.font.withSize(12)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
    }
    
    func configureIcon() {
        self.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        iconImageView.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
