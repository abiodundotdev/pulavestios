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
    @EnvironmentObject var userSession : UserSession
    @State var showAlertDialogue : Bool = false
    @State var isLoading : Bool = false
    @StateObject var  loginRequestData = LoginRequestData()


    var body: some View {
        @StateObject var authViewModel = AuthViewModel(userSession);

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
                    LabeledForm(label: "Email address", value: $loginRequestData.email)
                    10.vspacer
                    LabeledSecureForm(label: "Password", value: $loginRequestData.password)
                    10.vspacer
                    ContainedButton(isLoading : isLoading, title: "Login") {
                        Task{
                            isLoading.toggle()
                            await handleSubmit(authViewModel)
                            isLoading.toggle()
                        }
                    }
            }
        }.padding(.all, 15.0).alert("Kindly check your email or password", isPresented: $showAlertDialogue) {
            Button("Close", role: .cancel) { }
        }
    }
    
    func handleSubmit(_ avm : AuthViewModel) async {
        guard (!loginRequestData.isValid) else {
            showAlertDialogue = true
            return;
        }
        do{
            var _ = try await avm.login(loginRequestData: loginRequestData)
            navigator.routes.append(Routes.register)
        }catch {
            print(error.localizedDescription);
        }
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage().environmentObject(ThemeManager())
        //page
    }
}

struct LabeledForm : View {
    var label : String
    @Binding var value : String;
    var body  : some View {
        VStack( alignment: .leading){
            Text(label).font(.caption)
            10.vspacer
            TextField(label, text: $value).textFieldStyle(RoundedBorderTextFieldStyle()).border( value.isEmpty ? Color.gray : Color.red )
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
            SecureField(label, text: $value).textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}


struct ContainedButton : View {
    @State private var isAnimating: Bool = false
    @EnvironmentObject var theme: ThemeManager
    var disabled: Bool = false
    var isLoading: Bool = false
    var title : String
    var action : VoidCallback
    var body  : some View {
        let currentTheme = self.theme.current
        Button(action: {
            isAnimating.toggle()
            let delayInSeconds = 0.1 // The delay duration in seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
                isAnimating.toggle()
            }
         action()
        }){
            if(isLoading){
                ProgressView()
            }else{
                Text(title)
            }
        }.disabled(disabled).frame(maxWidth: .infinity).padding([.horizontal, .vertical], 10.0).background(currentTheme.colors.primary).clipShape(RoundedRectangle(cornerRadius: currentTheme.shapes.mediumCornerRadius)).foregroundColor(.white).scaleEffect(isAnimating ? 0.9 : 1.0)
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
