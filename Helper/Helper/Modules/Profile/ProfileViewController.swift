//
//  ProfileViewController.swift
//  Helper
//
//  Created by Алла on 23.09.2026.
//

import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Private Properties
    
    private let profileViewModel: ProfileViewModelProtocol
    
    // MARK: - Init
    
    init(profileViewModel: ProfileViewModelProtocol) {
        self.profileViewModel = profileViewModel
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
