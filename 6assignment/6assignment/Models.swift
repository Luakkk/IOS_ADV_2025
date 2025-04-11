//
//  Models.swift
//  6assignment
//
//  Created by Alua Smanova on 11.04.2025.
//

struct CurrentWeather: Decodable { let temp: Double }
struct Forecast: Decodable { let daily: [DayForecast] }
struct DayForecast: Decodable { let day: String; let temp: Double }
struct AirQuality: Decodable { let index: Int }
struct WeatherAlert: Decodable { let title: String }
