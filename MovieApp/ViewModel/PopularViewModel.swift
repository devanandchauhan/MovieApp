//
//  PopulerViewModel.swift
//  MovieApp
//
//  Created by Devanand Chauhan on 07/04/24.
//

import Foundation
import MovieServiceSDK

class PopularViewModel {
    
    let service = MovieService.shared
    var movies = [Movie]()
    
    var reloadData: (()->())?
    
    func getPopularMoviesData() {
       // MovieService.shared.apiKey = "417f143d5bdda6f95d3bacc9f9fe73a5"

        service.fetchMovies(from: .popular) { result in
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
