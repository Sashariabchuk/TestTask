//
//  ListViewModel.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 03.01.2022.
//

import Foundation

protocol ListDelegate {
    func reload(with data: [Cats])
}

class ListViewModel {
    weak var coordinator: AppCoordinator!
    
    var delegate: ListDelegate?
    
    func getDetail(of catID: String) {
        
    }
    
    func getCats() {
        NetworkService.shared.fetchData(url: Constants.CatsURL) { (result: Result<[Cats], Error>) in
            switch result {
                case .success(let data):
                    print(data)
                    self.delegate?.reload(with: data)
                case .failure(let error):
                    print(error)
            }
        }

    }
}
