//
//  ServiceFactory.swift
//  Helper
//
//  Created by Alla Mozharova on 20.10.2026.
//

import Foundation

final class ServiceFactory: ServiceFactoryProtocol {
    let networkService: NetworkServiceProtocol = NetworkService()
    let locationService: LocationServiceProtocol = LocationService()
}
