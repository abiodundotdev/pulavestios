//
//  HttpClient.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 27/08/2023.
//

import Foundation
protocol HttpClientInterface{
    func get<Response>(url : String) -> Response
    func post<Response>(url : String, data : Codable) -> Response
    func form<Response>(url : String, data : Codable) -> Response
}
