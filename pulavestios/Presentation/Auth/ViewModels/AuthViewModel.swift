//
//  AuthViewModel.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 02/09/2023.
//

import Foundation
import Factory
import Combine

class AuthViewModel : ObservableObject{
    init(appState : AppState) {
        self.appState = appState
    }
    var appState: AppState
    
    @Injected(\.repository) private var repository
    
    func login( loginRequestData : LoginRequestData) async throws{
        do{
           let res = try await repository.auth.login(requestData: loginRequestData)
               await MainActor.run {
                   appState.user = UserCompleted(value: res.user)
               }
           }catch{
            await MainActor.run {
                appState.user = UserError(message: error.localizedDescription)
            }
        }
    }
    }





class AppState{
    init(user: UserState) {
        self.user = user
    }
    @Published var user: UserState
}
 

protocol UserState{}


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
