//
//  ServiceFactoryProtocol.swift
//  Helper
//
//  Created by Alla Mozharova on 21.10.2026.
//

import Foundation

protocol ServiceFactoryProtocol {
    var networkService: NetworkServiceProtocol { get }
    var locationService: LocationServiceProtocol { get }
}
