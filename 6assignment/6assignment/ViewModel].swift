//
//  ViewModel].swift
//  6assignment
//
//  Created by Alua Smanova on 11.04.2025.
//

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var currentWeather: CurrentWeather?
    @Published var forecast: Forecast?
    @Published var aqi: AirQuality?
    @Published var alerts: [WeatherAlert] = []
    @Published var state: LoadingState = .idle

    let service = WeatherService()

    func load(for location: String) {
        state = .loading
        Task {
            do {
                let (current, forecast, aqi, alerts) = try await service.fetchWeatherData(for: location)
                self.currentWeather = current
                self.forecast = forecast
                self.aqi = aqi
                self.alerts = alerts
                self.state = .success
            } catch {
                self.state = .failed(error)
            }
        }
    }
}
