//
//  UI.swift
//  6assignment
//
//  Created by Alua Smanova on 11.04.2025.
//

struct WeatherView: View {
    @StateObject private var vm = WeatherViewModel()
    @State private var location = "Almaty"

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Refresh") { vm.load(for: location) }

                switch vm.state {
                case .idle: Text("Idle...")
                case .loading: ProgressView()
                case .success:
                    List {
                        if let current = vm.currentWeather {
                            Text("Temp: \(current.temp)°C")
                        }
                        if let forecast = vm.forecast {
                            ForEach(forecast.daily, id: \ .day) { day in
                                Text("\(day.day): \(day.temp)°C")
                            }
                        }
                        if let aqi = vm.aqi {
                            Text("Air Quality Index: \(aqi.index)")
                        }
                        ForEach(vm.alerts, id: \ .title) { alert in
                            Text("Alert: \(alert.title)")
                        }
                    }
                case .failed(let error):
                    Text("Error: \(error.localizedDescription)")
                }
            }
            .navigationTitle("Weather App")
        }
        .onAppear { vm.load(for: location) }
    }
}
