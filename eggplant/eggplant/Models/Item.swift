//
//  Item.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 25/09/23.
//

import UIKit

class Item: NSObject {
    
    // MARK: = Atributos
    let nome: String
    let calorias: Double
    
    // MARK: - Construtor/Init
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
}
