//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Pushpahas Kuchipudi on 9/13/24.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func getWeather(for city: String) -> AnyPublisher<WeatherData, Error>
    func getWeatherForLocation(lat: Double, lon: Double) -> AnyPublisher<WeatherData, Error>
}

class NetworkManager: NetworkManagerProtocol {
    private let apiKey = "9ca465f5c8109f88e611cce3750d73c0"
    
    func getWeather(for city: String) -> AnyPublisher<WeatherData, Error> {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getWeatherForLocation(lat: Double, lon: Double) -> AnyPublisher<WeatherData, Error> {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
