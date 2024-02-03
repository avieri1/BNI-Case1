//
//  Model_QR.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import Foundation

struct Model_QR: Codable {
    var bank: String?
    var id: String?
    var merchant_name: String?
    var nominal: Int?
    
    init(bank: String? = nil, id: String? = nil, merchant_name: String? = nil, nominal: Int? = nil) {
        self.bank = bank
        self.id = id
        self.merchant_name = merchant_name
        self.nominal = nominal
    }
}

struct Rekening: Codable {
    
    var saldo: Int?
    
}

struct Riwayat: Codable {
    var merchant_name: String?
    var nominal: Int?
    
    init(merchant_name: String? = nil, nominal: Int? = nil) {
        self.merchant_name = merchant_name
        self.nominal = nominal
    }
}

struct ListRiwayat {
    var riwayat: [Riwayat]
    
    mutating func add(riwayat: Riwayat) {
        self.riwayat.append(riwayat)
        }
    
}

