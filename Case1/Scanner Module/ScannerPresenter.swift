//
//  ScannerPresenter.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation
import VisionKit

protocol AnyScannerPresenter {
    var router: AnyScannerRouter? { get set }
    var interactor: AnyScannerInteractor? { get set }
    var view: AnyScannerView? { get set }
    
    func interactorDidFetchModelQR(with modelQR: Model_QR)
    func viewDidScanModelQR(with addedItems: [RecognizedItem])
    func viewDidDetail(with jumlahSaldo:Int, with modelQR: Model_QR)
}

class ScannerPresenter: AnyScannerPresenter {
   
    var router: AnyScannerRouter?
    
    var interactor: AnyScannerInteractor?
    
    var view: AnyScannerView?
    
    func interactorDidFetchModelQR(with modelQR: Model_QR) {
        view?.show(with: modelQR)
    }
    
    func viewDidScanModelQR(with addedItems: [RecognizedItem]) {
        interactor?.getModelQR(addedItems: addedItems)
    }
    
    func viewDidDetail(with saldo: Int, with modelQR: Model_QR) {
        router?.pushToDetail(on: view!, with: modelQR, with: saldo)
    }
   
    
}
