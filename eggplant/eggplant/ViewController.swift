//
//  ViewController.swift
//  eggplant
//
//  Created by Marcel Leite de Farias on 19/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var hapynessTextField: UITextField!
    
    @IBAction func addFeedBack(_ sender: Any) {
        let name: String = nameTextField.text!
        let feedback: String = hapynessTextField.text!
        
        print("Comi: \(name) e fiquei com felicidade de: \(feedback)")
    }
    

}

