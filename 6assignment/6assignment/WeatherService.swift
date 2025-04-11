//
//  WeatherService.swift
//  6assignment
//
//  Created by Alua Smanova on 11.04.2025.
//

class WeatherService {
    private let apiKey = "YOUR_API_KEY"
    private let baseURL = "https://api.weatherapi.com/v1"
    
    func fetchWeatherData(for location: String) async throws -> (CurrentWeather, Forecast, AirQuality, [WeatherAlert]) {
        return try await withThrowingTaskGroup(of: Any.self) { group in
            var current: CurrentWeather?
            var forecast: Forecast?
            var aqi: AirQuality?
            var alerts: [WeatherAlert] = []

            group.addTask { try await self.fetchCurrentWeather(location) as Any }
            group.addTask { try await self.fetchForecast(location) as Any }
            group.addTask { try await self.fetchAirQuality(location) as Any }
            group.addTask { try await self.fetchAlerts(location) as Any }

            for try await result in group {
                switch result {
                case let data as CurrentWeather: current = data
                case let data as Forecast: forecast = data
                case let data as AirQuality: aqi = data
                case let data as [WeatherAlert]: alerts = data
                default: break
                }
            }

            guard let current = current, let forecast = forecast, let aqi = aqi else {
                throw URLError(.badServerResponse)
            }

            return (current, forecast, aqi, alerts)
        }
    }

    private func fetchCurrentWeather(_ location: String) async throws -> CurrentWeather {
        let url = URL(string: "\(baseURL)/current.json?key=\(apiKey)&q=\(location)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CurrentWeather.self, from: data)
    }
    private func fetchForecast(_ location: String) async throws -> Forecast {
        let url = URL(string: "\(baseURL)/forecast.json?key=\(apiKey)&q=\(location)&days=5")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Forecast.self, from: data)
    }
    private func fetchAirQuality(_ location: String) async throws -> AirQuality {
        let url = URL(string: "\(baseURL)/current.json?key=\(apiKey)&q=\(location)&aqi=yes")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(AirQuality.self, from: data)
    }
    private func fetchAlerts(_ location: String) async throws -> [WeatherAlert] {
        let url = URL(string: "\(baseURL)/alerts.json?key=\(apiKey)&q=\(location)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([WeatherAlert].self, from: data)
    }
}
