//
//  Repository.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 02/09/2023.
//

import Foundation

class Repository {
    var auth :AuthRepositoryInterface
    init(auth: AuthRepositoryInterface) {
        self.auth = auth
    }
}
