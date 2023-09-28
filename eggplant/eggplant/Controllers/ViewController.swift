//
//  ViewController.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 19/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
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
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
    }
    
    
    
    

}

