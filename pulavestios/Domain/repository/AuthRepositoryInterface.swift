//
//  AuthRepositoryInterface.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 27/08/2023.
//

import Foundation

protocol AuthRepositoryInterface{
    func login(requestData: LoginRequestData) async throws -> LoginResponseData
}
