//
//  DetailTransaksiVC.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import UIKit

//protocol DetailTransaksiDelegate
//{
//    func pembayaranSukses(SaldoNow: Int)
//    func riwayatPembayaran(riwayat: [Riwayat])
//}
protocol AnyDetailView {
    var presenter: AnyDetailPresenter? { get set }
    var modelQR: Model_QR? { get set }
    var saldo: Int? { get set }
    func showPopup(with saldo: Int)
}

class DetailTransaksiVC: UIViewController, AnyDetailView {
    
    var saldo: Int?

    var modelQR: Model_QR?

    var presenter: AnyDetailPresenter?
    
    func showPopup(with saldo: Int) {
        let popup = PopupVC()
        popup.modalPresentationStyle = .overFullScreen
        present(popup, animated: true)
        presenter?.viewBackHome(with: saldo)
        
    }


    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nominalLbl: UILabel!
    
    @IBOutlet weak var bayarBtn: UIButton!

    var getRiwayat = [Riwayat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idLbl.text = modelQR?.id
        nameLbl.text = modelQR?.merchant_name
        nominalLbl.text = modelQR?.nominal?.formattedWithSeparator
    }

    @IBAction func bayarClicked(_ sender: Any) {
        
        presenter?.viewDidBayar(with: modelQR?.nominal ?? 0, with: saldo!)
        
    }
    
}
