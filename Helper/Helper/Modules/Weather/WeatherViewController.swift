//
//  WeatherViewController.swift
//  Helper
//
//  Created by Алла on 23.09.2026.
//

import UIKit

final class WeatherViewController: UIViewController {
    // MARK: - Private Properties
    
    private let weatherViewModel: WeatherViewModelProtocol
    
    // MARK: - Init
    
    init(weatherViewModel: WeatherViewModelProtocol) {
        self.weatherViewModel = weatherViewModel
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
