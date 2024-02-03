//
//  DetailInteractor.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation

protocol AnyDetailInteractor {
    var presenter: AnyDetailPresenter? { get set }
    var saldo: Int? { get set }
    
    func getUpdatedSaldo(with nominal: Int, with saldo: Int)
}

class DetailInteractor: AnyDetailInteractor {
    
    var saldo: Int?
    
    var presenter: AnyDetailPresenter?
    
    func getUpdatedSaldo(with nominal: Int, with saldo: Int) {
        self.saldo = saldo
        self.saldo = self.saldo! - nominal
        presenter?.interactorDidUpdateSaldo(with: self.saldo ?? 0)
    }
}
