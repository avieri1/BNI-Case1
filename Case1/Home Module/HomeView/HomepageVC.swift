//
//  HomepageVC.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import UIKit

protocol AnyHomeView {
    var presenter: AnyHomePresenter? { get set }
    
    func updateRekening(with rekening: Rekening)
}

class HomepageVC: UIViewController, AnyHomeView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var presenter: AnyHomePresenter?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var hideIcon: UIImageView!
    @IBOutlet weak var saldoLbl: UILabel!
    
    private var imagesList = ["arrow.left.arrow.right", "doc.plaintext.fill"]
    private var titleList = ["Transaksi", "Riwayat"]
   
    var saldoIsHidden = true
    var rekening: Rekening?
    var saldo: Int?
    var riwayatTransaksi = [Riwayat]()
    
    func updateRekening(with rekening: Rekening) {
        DispatchQueue.main.async { [self] in
            self.rekening = rekening
            
            if saldoIsHidden == false {
                saldoLbl.text = rekening.saldo?.formattedWithSeparator
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saldoLbl.text = "*******"
        hideIcon.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showHide))
        hideIcon.addGestureRecognizer(tapGesture)

        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: HomeMenuCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeMenuCell.identifier)
        collectionView.reloadData()
        
        
    }
    
    @objc func showHide() {
        DispatchQueue.main.async { [self] in
            if saldoIsHidden {
                hideIcon.image = UIImage(systemName: "eye.fill")
                saldoIsHidden = false
                saldoLbl.text = self.rekening?.saldo?.formattedWithSeparator
            }
            else {
                hideIcon.image = UIImage(systemName: "eye.slash.fill")
                saldoIsHidden = true
                saldoLbl.text = "*******"
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCell.identifier, for: indexPath) as! HomeMenuCell
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        
        cell.setup(image: UIImage.init(systemName: imagesList[indexPath.item], withConfiguration: configuration)!, title: titleList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let nextVC = ScannerVC()

            nextVC.riwayatTransaksi = riwayatTransaksi
            presenter?.viewDidGoToScanner(with: rekening!)
  
        case 1:
            let nextVC = RiwayatVC()
            nextVC.getRiwayat = riwayatTransaksi
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
            ()
        }
    }
    
    func riwayatPembayaran(riwayat: [Riwayat]) {
        riwayatTransaksi = riwayat
    }

}
