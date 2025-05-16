//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Vaishnavi Deshmukh on 12/05/25.
//

import Foundation

@available(iOS 14.0, *)

public final class WeatherRouter {
    public static func createModule(city: City, apiKey: String) -> WeatherLandingView {
        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor()
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.city = city
        interactor.apiKey = apiKey
        return WeatherLandingView(presenter: presenter)
    }
}



