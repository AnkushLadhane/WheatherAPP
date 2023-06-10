//
//  DemoWeatherAppApp.swift
//  DemoWeatherApp
//
//  Created by Ankush Ladhane on 10/06/23
//

import SwiftUI

@main
struct DemoWeatherAppApp: App {
    @ObservedObject var viewModel = WeatherByCityViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
               SearchByCityView(viewModel: viewModel)
            }
        }
    }
}
