//
//  Model.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 16.06.2022.
//

import Foundation

struct API: Decodable {
    let info: Intro
    let results: [Character]
}

// MARK: - Info
struct Intro: Decodable {
    let count, pages: Int
    let next: String
}

// MARK: - Result
struct Character: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
