//
//  HomeRouter.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation
import UIKit

typealias EntryPoint = AnyHomeView & UIViewController

protocol AnyHomeRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyHomeRouter
    static func back(with saldo: Int) -> UIViewController
    func pushToDetail(on view: AnyHomeView, with rekening: Rekening)
}

class HomeRouter: AnyHomeRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyHomeRouter {
        let router = HomeRouter()
        
        var view: AnyHomeView = HomepageVC()
        var presenter: AnyHomePresenter = HomePresenter()
        var interactor: AnyHomeInteractor = HomeInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        return router
    }
    
    static func back(with saldo: Int) -> UIViewController {
        let viewController = HomepageVC()
        
        let presenter: AnyHomePresenter = HomePresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.saldo = saldo
        
        return viewController
    }
    
 
    func pushToDetail(on view: AnyHomeView, with rekening: Rekening) {
        DispatchQueue.main.async {
            let detailVC = ScannerRouter.start(rekening: rekening)
            let vc = view as! HomepageVC
            vc.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
}
