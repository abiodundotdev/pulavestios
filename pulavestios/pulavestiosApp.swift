//
//  pulavestiosApp.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 07/08/2023.
//

import SwiftUI

@main
struct PulavestApp: App {
    var theme = ThemeManager()
    @StateObject private var navigationState = NavigationState()
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
            }.environmentObject(theme).environmentObject(navigationState)
        }
    }
}
    
    
class NavigationState : ObservableObject{
    @Published var routes : [Routes] = []
}
    
    
enum Routes{
        case login
        case register
        case dashboard
        case invest
}
