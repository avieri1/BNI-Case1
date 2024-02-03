//
//  DetailRouter.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation
import UIKit

protocol AnyDetailRouter {
    
    static func start(with saldo: Int, modelQR: Model_QR) -> UIViewController
    func backHome(on view: AnyDetailView, with saldo: Int)
}

class DetailRouter: AnyDetailRouter {
   
    static func start(with saldo: Int, modelQR: Model_QR) -> UIViewController {
        let viewController = DetailTransaksiVC()
        
        let presenter: AnyDetailPresenter = DetailPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor?.saldo = saldo
        viewController.modelQR = modelQR
        viewController.saldo = saldo
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        
        return viewController
    }
    
    func backHome(on view: AnyDetailView, with saldo: Int) {
        DispatchQueue.main.async {
            let detailVC = HomeRouter.back(with: saldo)
            let vc = view as! DetailTransaksiVC

            vc.navigationController?.popToRootViewController(animated: true)
        }
    }

    
}
