//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Vaishnavi Deshmukh on 12/05/25.
//

import Foundation

@available(iOS 14.0, *)
public final class WeatherRouter {
    public static func createModule() -> WeatherLandingView {
        var apiKey:String
        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor()
        presenter.interactor = interactor
        interactor.presenter = presenter
        return WeatherLandingView(presenter: presenter)
    }
}


