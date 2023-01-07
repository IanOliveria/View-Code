//
//  ViewController.swift
//  Churck Norris VC
//
//  Created by Ian Oliveira on 28/12/22.
//

import UIKit

class ChuckNorrisVC: UIViewController {
    
    var chuckNorrisScreen: ChuckNorrisScreen?
    
    var mensagem: [DataChuckNorris] = []
    var searchin = false
    var searchinMensagem = [DataChuckNorris]()
    let searchController = UISearchController(searchResultsController: nil)
    
    let spaceBetweenSections: CGFloat = 4
    
    override func loadView() {
        self.chuckNorrisScreen = ChuckNorrisScreen()
        self.view = self.chuckNorrisScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CHUCK NORRIS FACTS"
        self.chuckNorrisScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        
        for _ in 1..<6{
            self.recuperarMenssagemChuck()
        }
        configureSearchController()
        chuckNorrisScreen?.tableView.reloadData()
    }
    
    
    func recuperarMenssagemChuck() {
        
        if let url = URL(string: "https://api.chucknorris.io/jokes/random") {
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                if erro == nil {
                    if let dadosRetonro = dados {
//                        print("entrei")
//                        print(dadosRetonro)
                        do {
                            if let objetoJson = try JSONSerialization.jsonObject(with: dadosRetonro, options: []) as? [String: Any ] {
//                                print("entrei 2")
//                                print(objetoJson["value"])
                                if let categoria = objetoJson["value"] as? String { //print("entrei3")
                                    print(categoria)
                                    DispatchQueue.main.async(execute: {
//                                      self.fraseTextView.text = categoria
//                                      print(textoRecuperado)
                                        let mensagemAdd = DataChuckNorris(mensagem: categoria)
                                        self.mensagem.append(mensagemAdd)
                                        self.chuckNorrisScreen?.tableView.reloadData()
                                        
                                    })
                                    
                                }
                            }
                            
                        } catch {
                            print("erro ao formator o retorno")
                        }
                    }
                    
                } else {
                    print("Erro ao fazer a consulta do preço.")
                }
            }
            tarefa.resume()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchin {
            return searchinMensagem.count
        } else {
            
            return mensagem.count
        }
        
    }
    
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
//        searchController.searchBar.placeholder = ""
    }
    
}

extension ChuckNorrisVC: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searchin  = true
            searchinMensagem.removeAll()
            for mensagemPassada in mensagem {
                if mensagemPassada.mensagem.lowercased().contains(searchText.lowercased()){
                    searchinMensagem.append(mensagemPassada)
                }
            }
            
        } else {
            searchin  = false
            searchinMensagem.removeAll()
            searchinMensagem=mensagem
        }
        self.chuckNorrisScreen?.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return spaceBetweenSections
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChruckNorrisTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ChruckNorrisTableViewCell.identifier) as? ChruckNorrisTableViewCell
        if searchin{
            cell?.setUpCell(data: self.searchinMensagem [indexPath.section])
        }else {
            cell?.setUpCell(data: self.mensagem [indexPath.section])
        }
        
        
//        cell?.isUserInteractionEnabled = false  decide o clique
        return cell ?? UITableViewCell()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchin = false
        searchinMensagem.removeAll()
        self.chuckNorrisScreen?.tableView.reloadData()
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mensagemTexto = self.mensagem[indexPath.section]
        let mensagemShare = [mensagemTexto.mensagem]
        let activityViewController = UIActivityViewController(activityItems: mensagemShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        //        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.mail] caso queira excluit um canal
        
        self.present(activityViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)  // disselecionar a celula
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 150
    //    }
    
    
}


