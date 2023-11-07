//
//  ViewController.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 19/09/23.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add (_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet var itensTableView: UITableView!
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
//    var itens: [String] = ["Molho de tomate", "Quijo", "Ovo", "Presunto", "Pimenta"]
    var itens: [Item] = [Item]()
    var itensSelecionados: [Item] = [Item]()
    
    
    
    
    // MARK: - IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var hapynessTextField: UITextField!
    
    
    // MARK: - Métodos de ciclo de vida da view, View life cycle
    override func viewDidLoad() {
        //Quando a view acabou de ser carregada!
        //Criar um botão utilizando view code
        
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none {
            //adicionar os itens ao array
            celula.accessoryType = .checkmark
            
            itensSelecionados.append(itens[indexPath.row])
        } else {
            //Excluir os itens do array 
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
                
                //teste:
//                for itensRestantes in itensSelecionados {
//                    print(itensRestantes.nome)
//                }
            }
            
        }
        
        
    }
    
    // MARK: - IBActions
    @IBAction func addFeedBack(_ sender: Any) {
        
        //Pior forma com force unwrapp
        
        /*
         
         
         let name: String = nameTextField.text!
         let feedback: Int! = Int(hapynessTextField.text!)
         
         
         
         let refeicao = Refeicao(nome: name, felicidade: feedback)
         
         print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
         
         
         */
        
        // Melhor forma
        
        
        // utilizando if let
        /*
        if let nomeDaRefeicao = nameTextField?.text, let feedback = hapynessTextField?.text {
            let name: String = nomeDaRefeicao
            if let felicidade = Int(feedback) {
                let refeicao = Refeicao(nome: name, felicidade: felicidade)
                
                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
            } else {
                print("Erro ao tentar criar a refeição")
            }
        }
         */
        
        
        //utilizando guard let
        
        guard let nomeRefeicao = nameTextField?.text else {
            return
        }
        guard let feedback = hapynessTextField?.text, let felicidade = Int(feedback) else {
            return
        }
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade, itens: itensSelecionados)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        
        delegate?.add(refeicao)
        
        //funcao para retirar a tela, para voltar para tableview dissmiss
        navigationController?.popViewController(animated: true)
        
    }
    
}

