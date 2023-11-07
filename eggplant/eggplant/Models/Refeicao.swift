//
//  Refeicao.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 25/09/23.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    let nome: String
    let felicidade: Int
    var itens: [Item] = []
    
    // MARK: - Construtor/Init
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    
    // MARK: - Metodos
    func totalDeCalorias() -> Double {
        var total: Double = 0.0
        for item in itens {
            total += item.calorias
        }
        return total
    }
    
}
