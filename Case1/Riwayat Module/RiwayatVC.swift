//
//  RiwayatVC.swift
//  Case1
//
//  Created by aldo on 01/02/24.
//

import UIKit

class RiwayatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var getRiwayat: [Riwayat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: RiwayatCell.identifier, bundle: nil), forCellReuseIdentifier: RiwayatCell.identifier)
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (getRiwayat?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RiwayatCell.identifier, for: indexPath) as! RiwayatCell
        
        if indexPath.row == 0 {
            cell.leftLbl.text = "Nama Merchant"
            cell.rightLbl.text = "Nominal"
        }
        else{
            cell.leftLbl.text = getRiwayat?[indexPath.item - 1].merchant_name
            cell.rightLbl.text = getRiwayat?[indexPath.item - 1].nominal?.formattedWithSeparator
        }
        return cell
    }



}
