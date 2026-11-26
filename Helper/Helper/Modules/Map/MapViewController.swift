//
//  MapViewController.swift
//  Helper
//
//  Created by Алла on 23.09.2026.
//

import UIKit
import MapKit
import SnapKit

final class MapViewController: UIViewController {
    // MARK: - Private Properties
    
    private let mapViewModel: MapViewModelProtocol
    private let mapView = MKMapView()
    
    private lazy var zoomInButton: UIButton = Self.makeMapButton(
        image: UIImage(systemName: "plus"),
        action: UIAction { _ in }
    )
    private lazy var zoomOutButton: UIButton = Self.makeMapButton(
        image: UIImage(systemName: "minus"),
        action: UIAction { _ in }
    )
    private lazy var userLocationButton: UIButton = Self.makeMapButton(
        image: UIImage(systemName: "location.fill"),
        action: UIAction { _ in }
    )
    private lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            zoomInButton,
            zoomOutButton,
            userLocationButton
        ])
        
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillEqually
                
        return stack
    }()
        
       
    // MARK: - Init
    
    init(mapViewModel: MapViewModelProtocol) {
        self.mapViewModel = mapViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        [mapView, buttonsStackView].forEach(view.addSubview)
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
            
        }
        
        [zoomInButton, zoomOutButton, userLocationButton].forEach {
            $0.snp.makeConstraints { make in
                make.size.equalTo(44)
            }
        }
    }
    
    private static func makeMapButton(image: UIImage?, action: UIAction) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.image = image
        config.baseForegroundColor = .darkGray
        config.baseBackgroundColor = .white
        config.cornerStyle = .fixed
        config.background.cornerRadius = 12
        
        return UIButton(
            configuration: config,
            primaryAction: action
        )
    }
}

// MARK: - Preview

#Preview {
    MapViewController(
        mapViewModel: MapViewModel()
    )
}


