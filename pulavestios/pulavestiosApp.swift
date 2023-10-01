//
//  pulavestiosApp.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 07/08/2023.
//

import SwiftUI
import ReSwift

@main
struct PulavestApp: App {
    var theme = ThemeManager()
    @StateObject private var navigationState = NavigationState()
    @StateObject private var userSession = UserSession()
    

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes){
                LoginPage().navigationDestination(for: Routes.self) { route in
                    switch route {
                    case .login:
                        LoginPage()
                    case .register:
                        RegisterPage()
                    case .dashboard:
                        Text("loginpage")
                    case .invest:
                        Text("loginpage")
                    }
                }
            }
            .environmentObject(theme).environmentObject(navigationState).environmentObject(userSession)
        }
    }
}
    
    
class NavigationState : ObservableObject{
    @Published var routes : [Routes] = []
}
    

let mainStore = Store<AppState2>(
    reducer: counterReducer,
    state: nil
)
    
enum Routes{
        case login
        case register
        case dashboard
        case invest
}


struct AppState2 {
    var counter: Int = 0
}


struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}


func counterReducer(action: Action, state: AppState2?) -> AppState2 {
    var state = state ?? AppState2()

    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }

    return state
}


