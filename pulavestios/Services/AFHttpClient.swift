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
    
    func get(url: String) async throws -> (Data?, HTTPURLResponse?) {
       var _request =  session.request(url, method: .get)
        return try await request(dataRequest: _request);
    }
    
    func post(url: String, data: Encodable) async throws -> (Data?, HTTPURLResponse?) {
        var _request = session.request(url, method: .post, parameters: data, encoder: JSONParameterEncoder.default)
        return try await request(dataRequest: _request);
    }
    
    func form(url: String, data: Codable) async throws -> (Data?, HTTPURLResponse?) {
        var _request =  session.request(url, method: .post)
         return try await request(dataRequest: _request);
    }
    
    private func request(dataRequest: DataRequest) async throws ->  (Data?, HTTPURLResponse?) {
        var _error : AFError?
        var _response : (Data?, HTTPURLResponse?)
            dataRequest
            .validate()
            .responseData{response in
            switch response.result {
                    case .success:
                    guard let _ = response.data else {
                        _error = .none
                        return
                    }
                    _response = (response.data!, response.response)
                    break
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

typealias AppResponse = (Data?, HTTPURLResponse?)
