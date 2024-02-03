//
//  HomeInteractor.swift
//  Case1
//
//  Created by aldo on 03/02/24.
//

import Foundation

protocol AnyHomeInteractor {
    var presenter: AnyHomePresenter? { get set }
    
    func getRekening()
}

class HomeInteractor: AnyHomeInteractor {
    
    var saldo: Int?
    
    var presenter: AnyHomePresenter?
    
    func getRekening() {
        
        let rekening = Rekening(saldo: 500000)
        presenter?.interactorDidFetchRekening(with: rekening)
    
    }
    
}
