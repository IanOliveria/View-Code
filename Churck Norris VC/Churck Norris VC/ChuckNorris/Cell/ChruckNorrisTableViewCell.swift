//
//  ChruckNorrisTableViewCell.swift
//  Churck Norris VC
//
//  Created by Ian Oliveira on 28/12/22.
//

import UIKit

class ChruckNorrisTableViewCell: UITableViewCell {

    static let identifier = "ChruckNorrisTableViewCell"
    
    lazy var mensagemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .darkGray

        return label
    }()
    
    lazy var shareImage: UIImageView = {
        let image =  UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "share")
     
        
        return image
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.ConfigSubView()
        self.configConstraints()
        self.layer.borderWidth = 1.7
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.backgroundColor  = UIColor(red: 250, green: 250, blue: 250, alpha: 1)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
//        setSelected(false, animated: false)
        
    }
    
    public func setUpCell(data:DataChuckNorris){
        self.mensagemLabel.text = data.mensagem
    }
    
    func ConfigSubView(){
        self.addSubview(self.mensagemLabel)
        self.addSubview(self.shareImage)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
        
            self.mensagemLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.mensagemLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.mensagemLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.mensagemLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -45),
            self.mensagemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            self.textView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
//            self.shareImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.shareImage.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -45),
            self.shareImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            shareImage.heightAnchor.constraint(equalToConstant: 40),
            shareImage.widthAnchor.constraint(equalToConstant: 40)
           
        
        ])
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
