//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Vaishnavi Deshmukh on 12/05/25.
//

import Foundation
import CoreData

@available(iOS 14.0, *)

public final class WeatherRouter {
    public static func createModule(city: City, apiKey: String) -> WeatherLandingView {
        let context = PersistenceController.shared.container.viewContext
        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor()
        let interactorHistory = WeatherHistoryInteractor(context: context)
        let presenterHistory = WeatherHistoryPresenter(interactor: interactorHistory)
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.presenterHistory = presenterHistory
        interactor.city = city
        interactor.apiKey = apiKey
        return WeatherLandingView(presenter: presenter)
    }
}


