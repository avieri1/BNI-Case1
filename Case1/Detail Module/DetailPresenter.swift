//
//  DetailPresenter.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation

protocol AnyDetailPresenter {
    var router: AnyDetailRouter? { get set }
    var interactor: AnyDetailInteractor? { get set }
    var view: AnyDetailView? { get set }
    
    func viewDidBayar(with nominal: Int, with saldo: Int)
    func interactorDidUpdateSaldo(with saldo: Int)
    func viewBackHome(with saldo: Int)
}

class DetailPresenter: AnyDetailPresenter {
    
    
    var router: AnyDetailRouter?
    
    var interactor: AnyDetailInteractor?
    
    var view: AnyDetailView?
    
    func viewDidBayar(with nominal: Int, with saldo: Int) {
        interactor?.getUpdatedSaldo(with: nominal, with: saldo)
    }
    
    func interactorDidUpdateSaldo(with saldo: Int) {
        view?.showPopup(with: saldo)
    }
    
    func viewBackHome(with saldo: Int) {
        router?.backHome(on: view!, with: saldo)
    }
    
    
}
