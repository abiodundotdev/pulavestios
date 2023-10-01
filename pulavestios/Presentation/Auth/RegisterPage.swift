//
//  RegisterPage.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 22/08/2023.
//

import Foundation
import SwiftUI
import Alamofire

struct RegisterPage :View {
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var emailAddress : String = ""
    @State private var country : String = ""
    
    @EnvironmentObject var navigator: NavigationState
    @EnvironmentObject var appState: AppState
    
    
    var body : some View {
        return ScrollView{
            VStack(alignment: .leading){
                Group{
                    Text("Hello there")
                    Text("Lets Get to know you")
                    10.vspacer
                    LabeledForm(label: "First name", value: $firstName)
                    10.vspacer
                    LabeledForm(label: "Last name", value: $lastName)
                    10.vspacer
                    LabeledForm(label: "Email address", value: $emailAddress)
                    10.vspacer
                    Group{
                        LabeledForm(label: "Country", value: $country)
                        10.vspacer
                        ContainedButton(title: "Register"){
                            print(appState.user)
                            
//                            var task = Task{
//                              try await testHttpRequest()
//                            }
                        
                        }
                    }
                }
                
            }
        }.padding(.all, 15.0)
    }
    
    func testHttpRequest() async throws {
        let url  = "https://api.mockfly.dev/mocks/f093e772-faf0-4595-8b38-7959c7b48235/user"
        do {
//            let request = AF.request(url, method: .get).responseDecodable(of:UserModel.self){response in
//                debugPrint(response)
//                }
//            AF.request(url).response { response in
//                debugPrint("Response with unserialized data: \(String(describing: response))")
//            }
            
//            AF.request(url).responseData { response in
//                debugPrint("Response: \(String(from: response.value))")
//            }
            
//            AF.request(url).responseString { response in
//                debugPrint("Response: \(response.data)")
//            }
            
            
//
//            AF.request(url).responseDecodable(of: UserModel.self) { response in
//                    switch response.result {
//                        case .success:
//                            print("Successful")
//                    case let .failure(error):
//                        print(error)
//                        }
//                //debugPrint("Response: \(response.value)")
//            }
            
        }catch{
            print(error)
        }
            
        
    }
    
//        .responseData{
//            respone in
//            print("The network request data is  \(String(data: respone.data ?? Data(), encoding: .utf8)) ")
//        }
        
    
    
    func testHttpRequestTwo() async throws {
        
        do {
            guard let url = URL(string : "https://api.mockfly.dev/mocks/f093e772-faf0-4595-8b38-7959c7b48235/user")else { return }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                  print("I am an invalid response ooo")
                return
            }
            print("Response data as string: \(String(describing: String(data: data, encoding: .utf8)))")
                
        }catch{
            print(error)
        }
            
        
    }
    
    
    
}





struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
       RegisterPage()
    }
}
