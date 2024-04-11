//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Devanand Chauhan on 08/04/24.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.isHidden = false
         collectionView.alpha = 1
         return collectionView
    }()
    
    private let moviePosterView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 6
        imageView.layer.shadowColor = UIColor.label.cgColor
        imageView.layer.shadowOpacity = 2
        imageView.layer.shadowOffset = CGSize(width: -4, height: -4)
        return imageView
    }()
    
    private let movieNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Name"
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let movieAverageLabel: UILabel = {
       let label = UILabel()
        label.text = "Rate"
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let movieYearLabel: UILabel = {
       let label = UILabel()
        label.text = "Year"
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let movieOverviewLabel: UILabel = {
       let label = UILabel()
        label.text = "Overview"
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private let scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        return scrollView
    }()
    
    private var labelStackView = UIStackView()
    
    
    var viewModel: DetailMovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = false

        style()
        layout()
        
        //Load The Latest Data
        movieNameLabel.text = viewModel?.movieTitle
        movieYearLabel.text = viewModel?.releaseDate
        movieAverageLabel.text = viewModel?.voteAverage
        movieOverviewLabel.text = viewModel?.overview
        
        if let posterURL = viewModel?.posterURL {
            guard let completeURL = URL(string: "https://image.tmdb.org/t/p/w500/\(posterURL)") else { return }
            self.moviePosterView.sd_setImage(with: completeURL)
        }
    }
    
    private func style() {
        scrollView.backgroundColor = .secondarySystemBackground
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        labelStackView = UIStackView(arrangedSubviews: [movieNameLabel, movieYearLabel])
        labelStackView.axis = .horizontal
        labelStackView.spacing = 12
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        moviePosterView.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        movieAverageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(moviePosterView)
        scrollView.addSubview(labelStackView)
        scrollView.addSubview(movieAverageLabel)
        scrollView.addSubview(movieOverviewLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            moviePosterView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            moviePosterView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            moviePosterView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            moviePosterView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 3/7),
            moviePosterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            labelStackView.topAnchor.constraint(equalTo: moviePosterView.bottomAnchor, constant: 16),
            labelStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant:  -12),
            
            movieAverageLabel.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 16),
            movieAverageLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
            movieAverageLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            movieOverviewLabel.topAnchor.constraint(equalTo: movieAverageLabel.bottomAnchor, constant: 10),
            movieOverviewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
            movieOverviewLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)])
    }
            
}
