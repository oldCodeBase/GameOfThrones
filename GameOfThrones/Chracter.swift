//
//  Chracter.swift
//  GameOfThrones
//
//  Created by Ibragim Akaev on 10/01/2021.
//

import Foundation

struct Character: Codable, Identifiable {
    
    let id: Int
    let firstName: String
    let lastName: String
    let fullName: String
    let title: String
    let family: String
    let image: String
    let imageUrl: String
}
