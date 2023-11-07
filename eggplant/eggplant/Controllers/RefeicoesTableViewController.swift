//
//  RefeicoesTableViewController.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 03/10/23.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    var refeicoes: [Refeicao] = [
                     Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Feijao", felicidade: 2),
                     Refeicao(nome: "Sushi", felicidade: 5),
                     Refeicao(nome: "Hamburguer", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Arroz", felicidade: 4),
                    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        return celula
        
    }
    
    func add (_ refeicao: Refeicao) {
    
        refeicoes.append(refeicao)
        //depois de adicionar um novo elemento no array precisamos pedir para
        //a tableview recarregar os seus dados.
        
        tableView.reloadData()
        
    }
    
    
    //precisamos refatorar a comunicação entre a RefeicoesTableViewController e a ViewController
    //a ViewController está conhcendo muitas coisas da Refeicoes, e o quanto menos ela conhecer melhor
    //por exemplo: Sem querer no fonte ViewController, poderia remover todos os dados do array de refeicoes de dentro da RefeicoesTableViewController
    //Entao precisamos diminuir essa comunicação utilzando um arquivo para intermediar. Um protocolo Isolar apenas a responsabilidade do metodo Add
    
    
    //RefeicoesTableViewController => ViewController
    
    //Agora: RefeicoesTableViewController => Protocolo => ViewController
    
    //Protocolo: Somente as informações necessarias
    // vamos chamar de delegate
    
    
    
    
    
    
    //passar informações entre controllers, nesse exemplo estou passando a instancia da minha classe para
    //conseguir utilizar um metodo lá na ViewController.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
        
        
    }
}
