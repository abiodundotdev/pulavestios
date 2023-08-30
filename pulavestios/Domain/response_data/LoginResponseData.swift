//
//  LoginResponseData.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 29/08/2023.
//

import Foundation
struct LoginResponseData: Codable {
    let message: String
    let user: UserModel
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case message, user
        case accessToken = "access_token"
    }
}
