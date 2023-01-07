//
//  ChuckNorrisScreen.swift
//  Churck Norris VC
//
//  Created by Ian Oliveira on 28/12/22.
//

import UIKit

class ChuckNorrisScreen: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ChruckNorrisTableViewCell.self, forCellReuseIdentifier: ChruckNorrisTableViewCell.identifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        backgroundColor = .white
        self.configConstraints()
        
    }
    
    func configSubView(){
        self.addSubview(self.tableView)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
        
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
//            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
