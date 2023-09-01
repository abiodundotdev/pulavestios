//
//  AFHttpClient.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 27/08/2023.
//

import Foundation
import Alamofire

class AFHttpClient : HttpClientInterface{
    
    var session : Session
    init(session: Session) {
        self.session = session
    }
    
    func get(url: String) async throws -> DataRequest {
       var request =  session.request(url, method: .get)
        return request;
    }
    
    func post(url: String, data: Encodable) async throws -> DataRequest {
        var response = session.request(url, method: .post, parameters: data, encoder: JSONParameterEncoder.default)
        return response;
    }
    
    func form(url: String, data: Codable) async throws -> DataRequest {
        var response =  session.request(url, method: .post)
         return response;
    }
    
    private func request(dataRequest: DataRequest) async throws ->  (Data?, HTTPURLResponse?)? {
        var _error : AFError?
        var _response : (Data?, HTTPURLResponse?)?
            dataRequest
            .validate()
            .responseData{response in
            switch response.result {
                    case .success:
                    _response = (response.data, response.response)
                    case let .failure(error):
                        _error = error
                }
            }
        if(_error != nil) {
            throw _error!;
        }
        return _response;
    }
}



//typealias
