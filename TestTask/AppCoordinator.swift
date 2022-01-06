//
//  AppCoordinator.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 03.01.2022.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "ListStoryboard", bundle: .main)
        let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        let listViewModel = ListViewModel()
        
        listViewModel.coordinator = self
        listViewController.viewModel = listViewModel
        listViewController.title = "List"
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.pushViewController(listViewController, animated: true)
    }
    
    func openDetail(with cat: Cats) {
        let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: .main)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let detailViewModel = DetailViewModel()
        
        detailViewModel.coordinator = self
        detailViewModel.cat = cat
        detailViewController.viewModel = detailViewModel
        detailViewController.title = "Detail"
    
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
