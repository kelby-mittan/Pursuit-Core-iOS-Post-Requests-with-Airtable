//
//  AirtableClient.swift
//  PostRequestsWithAirtable
//
//  Created by Kelby Mittan on 12/18/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct AirtableClient: Codable {
    let clientWrappers: [ClientWrapper]
    
    enum CodingKeys: String, CodingKey {
        case clientWrappers = "records"
    }
}

struct ClientWrapper: Codable {
    let fields: Client
}

struct Client: Codable {
    let name: String
    let about: String
    let logo: [Logo]
    
    enum CodingKeys1: String, CodingKey {
        case name = "Name"
        case about = "About"
        case logo = "Logo"
    }
}

struct Logo: Codable {
    let thumbnails: Thumbnails
}

struct Thumbnails: Codable {
    let large: LargeURL
}

struct LargeURL: Codable {
    let url: String
}
