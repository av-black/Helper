//
//  NewsViewController.swift
//  Helper
//
//  Created by Алла on 23.09.2026.
//

import UIKit

final class NewsViewController: UIViewController {
    // MARK: - Private Properties
    
    private let newsViewModel: NewsViewModelProtocol
    
    // MARK: - Init
    
    init(newsViewModel: NewsViewModelProtocol) {
        self.newsViewModel = newsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
