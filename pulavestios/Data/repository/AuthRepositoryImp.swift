//
//  AuthRepositoryImp.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 27/08/2023.
//

import Foundation
import Alamofire

class AuthRepositoryImpl : AuthRepositoryInterface {
    private var httpClient : any HttpClientInterface;
    
    init(httpClient: any HttpClientInterface) {
        self.httpClient = httpClient
    }
    
    func login(requestData: LoginRequestData) async throws -> LoginResponseData {
        let (data, response) = try await httpClient.post(url: Endpoints.login, data: requestData) as! AppResponse;
       let appResponse  = AppHttpResponse<LoginResponseData>(data: data)
        print(appResponse.decodedData)
        return appResponse.decodedData
    }
}

class AppHttpResponse<U : Codable> {
    var decodedData : U;
    init(data : Data?){
        let decoder = JSONDecoder()
        do{
            let responseData = try decoder.decode(U.self, from: data!)
            decodedData = responseData
        }catch {
            print(error)
            decodedData = ErrorMessage(message: "Error occur with handling") as! U
        }
    }
}


struct ErrorMessage :Codable{
    var message : String
}
