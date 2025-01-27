//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by Pushpahas Kuchipudi on 9/13/24.
//

import UIKit
import SwiftUI

class WeatherCoordinator {
    var navigationController: UINavigationController?
    
    func start() {
        let networkManager = NetworkManager()
        let viewModel = WeatherViewModel(networkManager: networkManager)
        let view = WeatherView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        navigationController = UINavigationController(rootViewController: hostingController)
    }
}

