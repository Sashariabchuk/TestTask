//
//  DetailViewController.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 06.01.2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.sd_setImage(
            with: viewModel?.getCatImageURL(with: viewModel?.cat?.id),
            placeholderImage: UIImage(named: "photo"),
            options: .continueInBackground,
            context: nil)
        
        dateLabel.text = viewModel?.getDate(from: viewModel?.cat?.createdAt)
    }
    
}
