//
//  RegisterPage.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 22/08/2023.
//

import Foundation
import SwiftUI

struct RegisterPage :View {
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var emailAddress : String = ""
    @State private var country : String = ""


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
                            print("i am calling on you oo")
                        }
                    }
                }
                
            }
        }.padding(.all, 15.0)
    }
}





struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
       RegisterPage()
    }
}
