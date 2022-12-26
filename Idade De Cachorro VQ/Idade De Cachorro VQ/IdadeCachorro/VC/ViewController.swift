//
//  ViewController.swift
//  Idade De Cachorro VQ
//
//  Created by Ian Oliveira on 21/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var idadeCachorroScreen: IdadeCachorroScreen?
    
    override func loadView() {
        self.idadeCachorroScreen = IdadeCachorroScreen()
        self.view = self.idadeCachorroScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idadeCachorroScreen?.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension ViewController: IdadeCachorroScreenProtocol {
    func actionDescobrirButton() {
        print(idadeCachorroScreen?.idadeTextField.text)
        if let idade = idadeCachorroScreen?.idadeTextField.text,
        let idadeInt = Int(idade) {
            var idadeCerta = idadeInt * 7
            idadeCachorroScreen?.resultadoLabel.text = "A idade do cachorro em anos Humanos é: " + String(idadeCerta)
        }
        
    }
    
}


