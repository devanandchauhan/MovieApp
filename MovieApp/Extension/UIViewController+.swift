//
//  UIViewController+.swift
//  MovieApp
//
//  Created by Devanand Chauhan on 10/04/24.
//

import UIKit
import MovieServiceSDK

extension UIViewController {
    func navigateToDetailView(with selectedMovie: Movie) {
        let detailViewController = DetailViewController()
        detailViewController.title = selectedMovie.title
        detailViewController.viewModel = DetailMovieModel(movieTitle: selectedMovie.title, posterURL: selectedMovie.posterPath ?? "", overview: selectedMovie.overview, releaseDate: selectedMovie.releaseDate ?? "", voteAverage: selectedMovie.ratingText, voteCount: selectedMovie.scoreText, id: selectedMovie.id)
        detailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
