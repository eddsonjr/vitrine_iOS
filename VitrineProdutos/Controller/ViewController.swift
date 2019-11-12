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
    
    
    //Referencia ao Dao
    var DAO: FirebaseDAO = FirebaseDAO()
    var listaDeCategorias: Array<Categorie>? = []
    
    var atualCategoriaIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
       //Acessando o banco de dados via web e extraindo os dados
        self.DAO.retrieveData(collectionName: "categories") { (listOfCategories) in
            print("SOMENTE TESTANDO....")
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
        self.atualCategoriaIndex = indexPath.section

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listaDeCategorias!.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = self.listaDeCategorias![section].name
        return sectionName
    }
    

    
    
    //MARK: collectionView datasource and delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        //return (self.listaDeCategorias![self.atualCategoriaIndex].bannersURL?.count)!
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        
//        collectionCell.imageView.loadImageUsingCache(withUrlString: self.listaDeCategorias![self.atualCategoriaIndex].bannersURL![indexPath.row])
        
        
        return collectionCell
    }
    
}

