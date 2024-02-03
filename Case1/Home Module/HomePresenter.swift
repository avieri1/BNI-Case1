//
//  HomePresenter.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation

protocol AnyHomePresenter {
    var router: AnyHomeRouter? { get set }
    var interactor: AnyHomeInteractor? { get set }
    var view: AnyHomeView? { get set }
    
    var saldo: Int? { get set }
    func interactorDidFetchRekening(with rekening: Rekening)
    func viewDidGoToScanner(with rekening: Rekening)
}

class HomePresenter: AnyHomePresenter {
    
    var router: AnyHomeRouter?
    
    var interactor: AnyHomeInteractor? {
        didSet {
            interactor?.getRekening()
        }
    }
    
    var saldo: Int?
    
    var view: AnyHomeView?
    
    func interactorDidFetchRekening(with rekening: Rekening) {
        view?.updateRekening(with: rekening)
    }
    
    func viewDidGoToScanner(with rekening: Rekening) {
        router?.pushToDetail(on: view!, with: rekening)
    }
    
    
}
