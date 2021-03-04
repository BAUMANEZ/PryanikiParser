//
//  Response.swift
//  PryanikiParser
//
//  Created by Арсений Токарев on 04.03.2021.
//

import Foundation

struct PryanikiResponse: Codable {
    let data: [ViewData]
    let view: [String]
}

struct ViewData: Codable {
    let name: String
    let data: ContentData
}

struct ContentData: Codable {
    let url: String?
    let text: String?
    let selectedID: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}
