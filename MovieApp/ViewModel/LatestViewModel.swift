//
//  LatestViewModel.swift
//  MovieApp
//
//  Created by Devanand Chauhan on 10/04/24.
//

import Foundation
import MovieServiceSDK

class LatestViewModel {
    
    let service = MovieService.shared
    var movies = [Movie]()
    
    var reloadData: (()->())?
    
    func getLatestMoviesData() {

        service.fetchMovies(from: .upcoming) { result in
            switch result {
            case .success(let movie):
                print(movie)
                self.movies = movie.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.reloadData?()
        }
    }
}
