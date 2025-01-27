//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Pushpahas Kuchipudi on 9/13/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            let networkManager = NetworkManager()
            let viewModel = WeatherViewModel(networkManager: networkManager)
            WeatherView(viewModel: viewModel)
        }
    }
}
