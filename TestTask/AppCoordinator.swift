//
//  AppCoordinator.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 03.01.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var child: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var child: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToListView()
    }
    
    func goToListView() {
        
        let storyboard = UIStoryboard(name: "ListStoryboard", bundle: .main)
        let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        let listViewModel = ListViewModel()
        
        listViewModel.coordinator = self
        listViewController.viewModel = listViewModel
        
        navigationController.pushViewController(listViewController, animated: true)
    }
}
