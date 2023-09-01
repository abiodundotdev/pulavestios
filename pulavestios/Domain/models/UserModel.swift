//
//  UserModel.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 29/08/2023.
//

import Foundation
struct UserModel: Codable {
    let id: Int
    let uuid, firstname, lastname: String
    let walletBalance: Double
    let fullname, accountNumber, accountName, bankName: String
    let email, phone: String
    let profileImage: String
    let currentDeviceID, currentDeviceName: String
    let lastLogin, lastLoginIP, appVersion, platform: String?
    let efgTag: String
    let isEmailVerified, isPinSet, isTagSet, status: Bool
    let isDeleted: Bool
    let createdAt, updatedAt: String
    
        enum CodingKeys: String, CodingKey {
          case id, uuid, firstname, lastname, walletBalance, fullname, accountNumber, accountName, bankName, email, phone, profileImage
          case currentDeviceID 
          case currentDeviceName, lastLogin
          case lastLoginIP
          case appVersion, platform, efgTag, isEmailVerified, isPinSet, isTagSet
          case status = "Status"
          case isDeleted, createdAt, updatedAt
      }
}
