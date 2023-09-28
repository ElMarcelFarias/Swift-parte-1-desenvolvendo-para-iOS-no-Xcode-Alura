import UIKit

let totalDeCalorias: [Double] = [20.5, 100.0]

func todasCalorias(totalDeCalorias: [Double]) -> Double {
    var total: Double = 0.0
    
    for caloria in totalDeCalorias {
        total += caloria
    }
    
    return total
    
}

let total = todasCalorias(totalDeCalorias: totalDeCalorias)
print("Total de caloria é \(total)")


let dictionary: [String: String] = [
    "Id": "1",
    "Nome": "Marcel",
    "cargo": "iOS Developer"
]

for (key, value) in dictionary {
    print("\(key) => \(value)")
}


let users: [[String: String]] = [
    [
        "first": "Lucy",
        "last": "Johnson"
    ],
    [
        "first": "Marcel",
        "last": "Leite de Farias"
    ]
]

for user in users {
    let msg = """

first \(user["first"] ?? "error.")
last: \(user["last"] ?? "error.")
"""
    print(msg)
}


//criar a primeira refeicao
let nome: String = "Macarrão"
let felicidade: String = "5"


// podemos criar uma classe que agrupe essas caracteristicas.

class Refeicao {
    var nome: String?
    var felicidade: String?
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
}

//let refeicao: Refeicao = Refeicao(nome: <#T##String#>, felicidade: <#T##String#>)

let numero = Int("5")

if let n = numero {
    print(n)
}


class Refeicao1 {
    
    // MARK: - Atributos
    var nome: String
    var felicidade: String
    var itens: [Item] = []
    
    // MARK: - Construtor
    
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = nome
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

class Item {
    
    // MARK: = Atributos
    var nome: String
    var calorias: Double
    
    // MARK: - Construtor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let refeicao = Refeicao1(nome: "Jantar", felicidade: "5")


let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijao", calorias: 90.0)
let contraFile = Item(nome: "Contra filé", calorias: 287.0)

refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

print(refeicao.nome)
if let primeiroItem = refeicao.itens.first {
    print(primeiroItem.nome)
}
//print(refeicao.itens.first?.nome)
print(refeicao.totalDeCalorias())


