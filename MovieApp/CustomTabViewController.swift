//
//  CustomTabViewController.swift
//  MovieApp
//
//  Created by Devanand Chauhan on 06/04/24.
//

import UIKit
import MovieServiceSDK

class CustomTabViewController: UITabBarController {
    
    private var popularViewModel = PopularViewModel()
    let popularViewController = PopularViewController()
    let latestViewController = LatestViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        tabBar.tintColor = .purple
        
        setupTabView()
        popularViewModel.getPopularMoviesData()
    }
    
    func setupTabView() {
        let popularVC = createNavController(with: "Popular Movies", and: UIImage(systemName: "movieclapper"), viewController: popularViewController)
        let latestVC = createNavController(with: "Latest Movies", and: UIImage(systemName: "popcorn"), viewController: latestViewController)
        
        setViewControllers([popularVC, latestVC], animated: true)
    }
    
    func createNavController(with title: String, and image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
}

extension CustomTabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}
