//
//  ScannerInteractor.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation
import VisionKit

protocol AnyScannerInteractor {
    var presenter: AnyScannerPresenter? { get set }
    var modelQR: Model_QR? { get set }
    func getModelQR(addedItems: [RecognizedItem])
}

class ScannerInteractor: AnyScannerInteractor {
    var presenter: AnyScannerPresenter?
    var modelQR: Model_QR?
    
    func getModelQR(addedItems: [RecognizedItem]) {
        switch addedItems[0] {
        case .barcode(let info):
            guard let stringInfo = info.payloadStringValue else { return }
            let stringAll = stringInfo.components(separatedBy: ".")
           
            modelQR = Model_QR(bank: stringAll[0],id: stringAll[1],merchant_name: stringAll[2],nominal: Int(stringAll[3]))
            
            presenter?.interactorDidFetchModelQR(with: modelQR!)
        default:
            ()
        }
    }
}
