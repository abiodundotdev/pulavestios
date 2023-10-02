//
//  LoginRequestData.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 27/08/2023.
//

import Foundation
class LoginRequestData : ObservableObject,Codable{
    @Published var email : String = ""
    @Published var password : String = ""
    
    // Required initializer for decoding
      required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          email = try container.decode(String.self, forKey: .email)
          password = try container.decode(String.self, forKey: .password)
      }
      
      // Required method for encoding
      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(email, forKey: .email)
          try container.encode(password, forKey: .password)
      }
      
      enum CodingKeys: CodingKey {
          case email
          case password
      }
}

extension LoginRequestData {
    var isValid : Bool {
        email.isEmpty && password.isEmpty
    }
}
