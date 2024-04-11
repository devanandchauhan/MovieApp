//
//  PopularCollectionCell.swift
//  MovieApp
//
//  Created by Devanand Chauhan on 07/04/24.
//

import UIKit
import SDWebImage

class PopularCollectionCell: UICollectionViewCell {

    // The cell's icon
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // The movie's name
    private let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = .darkGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // The movie's description
    private let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
        addDropShadow()
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Adds the views to the main one
    private func addViews(){
        self.contentView.addSubview(poster)
        self.contentView.addSubview(movieName)
        self.contentView.addSubview(movieDescription)
    }
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            poster.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            poster.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            poster.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            poster.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            movieName.heightAnchor.constraint(equalToConstant: 40),
            movieName.topAnchor.constraint(equalTo: self.poster.bottomAnchor, constant: 5),
            movieName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            movieName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor),
            movieDescription.heightAnchor.constraint(equalToConstant: 100),
            movieDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            movieDescription.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            movieDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5)
        ])
    }
    
    /// Configures the Cell
    func updateCell(posterURL: String?, movieTitle: String?, description: String?) {
        movieName.text = movieTitle
        movieDescription.text = description
        if let posterURL = posterURL {
            guard let completeURL = URL(string: "https://image.tmdb.org/t/p/w500/\(posterURL)") else { return }
            self.poster.sd_setImage(with: completeURL)
        }
    }

}
