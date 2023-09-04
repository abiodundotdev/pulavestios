//
//  AuthViewModel.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 02/09/2023.
//

import Foundation
import Factory

class AuthViewModel : ObservableObject{
    @Published var user : UserModel?
    @Published var isLoading : Bool = true
    
    @Injected(\.repository) private var repository
    
    func login( loginRequestData : LoginRequestData) async throws{
                if let res = try? await repository.auth.login(requestData: loginRequestData) {
                   await MainActor.run {
                       self.user = res.user
                       self.isLoading = true
                   }
               } else {
                   await MainActor.run {
                       self.isLoading = false
                   }
               }
        }
    }

