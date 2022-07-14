//
//  DataStruct.swift
//  VKServices
//
//  Created by juliemoorled on 14.07.2022.
//

import Foundation

struct JSONData: Decodable {
    let body: Body
    let status: Int
}

struct Body: Decodable {
    let services: [Service]
}

struct Service: Decodable {
    let name: String
    let description: String
    let link: String
    let icon_url: String
}

