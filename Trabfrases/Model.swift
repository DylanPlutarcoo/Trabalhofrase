//
//  main1.swift
//  Trabfrases
//
//  Created by userext on 16/05/23.
//

import Foundation

//MARK: Model

struct Phrase: Codable {

    var frases: [String]
    
}

struct Frases {
    
    var phrases: [String]
}
struct Respostas {
    var option: String

}
var option2 = Respostas(option: "")

var option = Respostas(option: "")
var frasesNovas = Frases(phrases: [""])
var frases = Frases(phrases: [""])
var fraseRetirar = Respostas(option: "")
