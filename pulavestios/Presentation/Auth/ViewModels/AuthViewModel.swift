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
        do{
            var resData = try await repository.auth.login(requestData: loginRequestData)
            user = resData.user;
        }catch{
            
        }
    }
}
