//
//  ViewController.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 14/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate{
    

    @IBOutlet var tableView: UITableView!
    
    
    //SOMENTE PARA TESTE - DAO
    var ref = DatabaseReference.init()
    var DAO: FirebaseDAO = FirebaseDAO()
    
    var listaDeCategorias: Array<Categoria>? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        //Somente para testes - Setando os valores de categoria - SALVANDO DADOS NO FIREBASE
        self.ref = Database.database().reference()
        
        
        //DAO.retrieveAllData(ref: self.ref, completionHandler: )
        DAO.retrieveAllData(ref: self.ref.child("ListaCategorias")) { (categoriasLista) in
            print("Retornado do banco: \(categoriasLista?.count)")
            self.listaDeCategorias = categoriasLista
            self.tableView.reloadData()
            
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: tableview datasource and delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewCell", for: indexPath) as! TableViewCell
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.reloadData()
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listaDeCategorias!.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = self.listaDeCategorias![section].nome
        return sectionName
    }
    

    
    
    //MARK: collectionView datasource and delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        var itens = self.listaDeCategorias![section].bannersURL?.count
        return itens!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        return collectionCell
    }
}

