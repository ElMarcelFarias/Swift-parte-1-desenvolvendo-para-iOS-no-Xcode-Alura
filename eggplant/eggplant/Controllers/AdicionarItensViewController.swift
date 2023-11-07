//
//  AdicionarItensViewController.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 07/10/23.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeItemTextField: UITextField!
    @IBOutlet var qtdCaloriaItemTextField: UITextField!
    
    // MARK: - Atributos
    var delegate: AdicionaItensDelegate?
    
    // MARK: - Metodo inicializador
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBAction
    
    
    @IBAction func adicionarItem(_ sender: Any) {
        // navegar para a proxima tela: navigationController.push()
        // voltar para a tela anterior: navigationController.pop()
        
        guard let nomeItem = nomeItemTextField.text, let caloriasItem = qtdCaloriaItemTextField.text else {
            return
        }
        
        guard let calorias = Double(caloriasItem) else {
            return
        }
        
        let item = Item(nome: nomeItem, calorias: calorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    

}
