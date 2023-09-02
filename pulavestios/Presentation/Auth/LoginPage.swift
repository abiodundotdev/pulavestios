//
//  LoginPage.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 07/08/2023.
//

import Foundation
import SwiftUI

struct LoginPage: View {
    @EnvironmentObject var theme: ThemeManager
    @EnvironmentObject var navigator: NavigationState
    @State private var emailAddressController : String = ""
    @State private var passwordController : String = ""

    //let currentTheme = self.theme.current
    
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        return ScrollView(){
            VStack(alignment: .center){
                Image("logo")
                20.vspacer
                HStack{
                    Text("Welcome Back, ").font(.custom("outfit_thin", size: 25.0))
                    Text("Tomiwa").font(.title).foregroundColor(.green)
                }
                Text("Kindly fill in the form to continue")
                10.vspacer
                LabeledForm(label: "Email address", value: $emailAddressController)
                10.vspacer
                LabeledSecureForm(label: "Password", value: $passwordController)
                10.vspacer
                ContainedButton(title: "Login" ) {
                    Task{
                        await handleSubmit()
                    }
                }
            }
        }.padding(.all, 15.0)
    }
    
    func handleSubmit() async {
        guard (!emailAddressController.isEmpty && !passwordController.isEmpty) else {
            print("Email or password cannot be empty")
            return;
        }
        let loginreq = LoginRequestData(email: emailAddressController, password: passwordController)
        try? await  authViewModel.login(loginRequestData: loginreq)
        //navigator.routes.append(Routes.register)
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage().environmentObject(ThemeManager())
    }
}

struct LabeledForm : View {
    var label : String
    @Binding var value : String;
    var body  : some View {
        VStack( alignment: .leading){
            Text(label).font(.caption)
            10.vspacer
            TextField(label, text: $value) .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}


struct LabeledSecureForm : View {
    var label : String
    @Binding var value : String;
    var body  : some View {
        VStack( alignment: .leading){
            Text(label).font(.caption)
            10.vspacer
            SecureField(label, text: $value) .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}


struct ContainedButton : View {
    @EnvironmentObject var theme: ThemeManager
    var disabled: Bool = false
    var title : String
    var action : VoidCallback
    var body  : some View {
        let currentTheme = self.theme.current
        Button(title, action: action).disabled(disabled).frame(maxWidth: .infinity).padding([.horizontal, .vertical], 10.0).background(currentTheme.colors.primary).clipShape(RoundedRectangle(cornerRadius: currentTheme.shapes.mediumCornerRadius)).foregroundColor(.white)
    }
}




extension Font{
    static func app(_ name: AppFonts, size: CGFloat) -> Font {
        return custom(name.rawValue, size: size)
    }
}


extension Int{
    var vspacer : some View { Spacer().frame(height: CGFloat(self))}
    var hspacer : some View { Spacer().frame(width: CGFloat(self))}
}



enum AppFonts : String {
    case black = "outfit_black"
    case regular = "outfit_regular"
    case medium = "outfit_medium"
}



protocol RepositoryProtocol {
    func getName() -> String
    func man() -> String
}


class DRepository : RepositoryProtocol{
    func getName() -> String {
      return "Qazeem Abiodun"
    }
    func man() -> String {
        return "I am a man"
    }
}


//        let data = (1...10).map{item in  DataS(id: item, name:  String(item))}

//        return List{
//            Section{
//                ForEach(data){da in
//                    Text("This is the item \(da.name)")
//                }
//            } header : {
//                Text("Listed items")
//            } footer : {
//                Text("This is a listed item footer ")
//            }
//        }


//
//struct DataS : Identifiable{
//    var id :Int
//    var name : String
//}
