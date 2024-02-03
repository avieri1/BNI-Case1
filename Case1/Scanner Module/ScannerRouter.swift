//
//  ScannerRouter.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation
import UIKit

protocol AnyScannerRouter {
    
    static func start(rekening: Rekening) -> UIViewController
    func pushToDetail(on view: AnyScannerView, with modelQR: Model_QR, with saldo: Int)
}

class ScannerRouter: AnyScannerRouter {
   
    static func start(rekening: Rekening) -> UIViewController {
        let viewController = ScannerVC()
        
        let presenter: AnyScannerPresenter = ScannerPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = ScannerRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.view?.rekening = rekening
        viewController.presenter?.interactor = ScannerInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        
        return viewController
    }
    
    func pushToDetail(on view: AnyScannerView, with modelQR: Model_QR, with saldo: Int) {
        DispatchQueue.main.async {
            let detailVC = DetailRouter.start(with: saldo, modelQR: modelQR)
            let vc = view as! ScannerVC
            vc.dismiss(animated: true)
            vc.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}
