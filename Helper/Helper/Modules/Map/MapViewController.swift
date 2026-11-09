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
        
        setupMapView()
    }
    
    // MARK: - Private methods
    
    private func setupMapView() {
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
