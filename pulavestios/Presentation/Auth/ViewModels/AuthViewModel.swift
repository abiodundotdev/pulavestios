//
//  AuthViewModel.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 02/09/2023.
//

import Foundation
import Factory
import Combine

class AuthViewModel: ObservableObject{
    @Published var isLoading : Bool = false
    
    private var userSession : UserSession
    init(_ userSession :  UserSession) {  self.userSession = userSession }
            
    @Injected(\.repository) private var repository

    func login(loginRequestData : LoginRequestData) async throws{
        isLoading = true
        defer { isLoading = false }
        do{
           let res = try await repository.auth.login(requestData: loginRequestData)
                   userSession.user = res.user
           } catch {
               print(error.localizedDescription)
        }
    }
    }


class UserSession : ObservableObject {
    @Published  var user : UserModel?
    @Published  var token : String = ""
}





class AppState: ObservableObject{
    init(user: UserState) {
        self.user = user
    }
    var user: UserState
}


protocol AnyState{}
 

protocol UserState: AnyState{}


struct UserLoading : UserState{}

struct  UserCompleted : UserState{
    var value : UserModel;
}
struct UserError : UserState{
    var message : String
}

extension UserState{
    var isLoading : Bool {
        self is UserLoading
    }
    
    var isCompleted : Bool {
        self is UserCompleted
    }
    
    var hasError : Bool {
        self is UserError
    }
}

func name(){
    var sub =  PassthroughSubject<String, Never>();
}


//
//await MainActor.run {
//
//}
