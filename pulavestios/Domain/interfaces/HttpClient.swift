//
//  HttpClient.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 27/08/2023.
//

import Foundation
protocol HttpClientInterface{
    associatedtype Response
    func get(url : String) async throws -> Response
    func post(url : String, data : Encodable) async throws  -> Response
    func form(url : String, data : Codable) async throws  -> Response
}



