//
//  DepedencyInjector.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 02/09/2023.
//

import Foundation
import Factory
import Alamofire

extension Container {
    var repository : Factory<Repository> {
        Factory(self) {
           return Repository(auth: AuthRepositoryImpl(httpClient:AFHttpClient(session: Session())))
        }
    }
    
//    var httpClient : Factory<HttpClientInterface> {
//        Factory(self) { AFHttpClient(session: Session())}
//    }
}

