//
//  PopupVC.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import UIKit

class PopupVC: UIViewController {

    @IBOutlet weak var dimmedView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = "Pembayaran Berhasil"
        dimmedView.alpha = 0.6
        self.view.backgroundColor = .clear
        self.modalPresentationStyle = .overFullScreen
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.disappear))
        dimmedView.addGestureRecognizer(tapGesture)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true)
        }
        
    }
    @objc func disappear() {
        dimmedView.alpha = 1.0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            
        }
    }

}
