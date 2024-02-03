//
//  ScannerVC.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import UIKit
import VisionKit

protocol AnyScannerView {
    var presenter: AnyScannerPresenter? { get set }
    var rekening: Rekening? { get set }
    func show(with modelQR: Model_QR)
}

class ScannerVC: UIViewController, AnyScannerView,  DataScannerViewControllerDelegate {
    
    var rekening: Rekening?

    var presenter: AnyScannerPresenter?
    
    func show(with modelQR: Model_QR) {
        self.modelQR = modelQR
        gotoDetail(modelQR: modelQR, saldo: rekening?.saldo ?? 0)
    }
    
    var modelQR: Model_QR?

    var riwayatTransaksi = [Riwayat]()
    var isScannerAvailable: Bool {
        DataScannerViewController.isAvailable && DataScannerViewController.isSupported
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard isScannerAvailable == true else {
            print("Scan tidak berfungsi. Mohon ulangi lagi")
            return
        }
        
        let qrScanner = DataScannerViewController(recognizedDataTypes: [.barcode()], isHighlightingEnabled: true)
        qrScanner.delegate = self
        present(qrScanner, animated: true) {
            try? qrScanner.startScanning()
        }
    }
    
    
    func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
        
        presenter?.viewDidScanModelQR(with: addedItems)

    }
    
    func gotoDetail(modelQR: Model_QR, saldo: Int) {
        presenter?.viewDidDetail(with: saldo, with: modelQR)
    }

}
