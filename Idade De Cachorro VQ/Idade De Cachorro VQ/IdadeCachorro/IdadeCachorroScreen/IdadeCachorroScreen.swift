//
//  IdadeCachorroScreen.swift
//  Idade De Cachorro VQ
//
//  Created by Ian Oliveira on 21/12/22.
//

import UIKit

protocol IdadeCachorroScreenProtocol: AnyObject {

    func actionDescobrirButton()
}

class IdadeCachorroScreen: UIView {
    
    weak var delegate: IdadeCachorroScreenProtocol?
    
//    func delegate(delegate:LoginScreenProtocol?){
//        self.delegate = delegate
//    }

    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cachorro")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var textoLabel: UILabel = {
     let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Digite a idade do seu cachorro, para descobrir a idade em anos humanos."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 116/255, green: 213/255, blue: 231/255, alpha: 1.0)
        
        return label
    }()
    
    lazy var idadeTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.keyboardType = .numberPad
        tf.placeholder = "Digite a idade do Cachorro"
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var descobrirButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("descobrir a idade", for: .normal)
        bt.setTitleColor(.none, for: .normal)
        bt.addTarget(self, action: #selector(tappedDescobrirButton), for: .touchUpInside)
        
        return bt
    }()
    
    lazy var resultadoLabel: UILabel = {
     let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = .systemTeal
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackGround()
        self.setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.logoImageView)
        self.addSubview(self.textoLabel)
        self.addSubview(self.idadeTextField)
        self.addSubview(self.descobrirButton)
        self.addSubview(self.resultadoLabel)
        
    }
    
    private func configBackGround() {
        self.backgroundColor = .systemTeal
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 175),
            
            self.textoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            self.textoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.textoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.textoLabel.heightAnchor.constraint(equalToConstant: 125),
        
            self.idadeTextField.topAnchor.constraint(equalTo: textoLabel.bottomAnchor, constant: 15),
            self.idadeTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.idadeTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.idadeTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.descobrirButton.topAnchor.constraint(equalTo: idadeTextField.bottomAnchor, constant: 15),
            self.descobrirButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.descobrirButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.descobrirButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.resultadoLabel.topAnchor.constraint(equalTo: descobrirButton.bottomAnchor, constant: 30),
            self.resultadoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.resultadoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.resultadoLabel.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
    
    @objc private func tappedDescobrirButton(){
        self.delegate?.actionDescobrirButton()
    }

}
