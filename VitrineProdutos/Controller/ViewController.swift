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
    var categoriaMusicais: Categoria = Categoria()
    var categoriaRock: Categoria = Categoria()
    var DAO: FirebaseDAO = FirebaseDAO()
    
    
    //Somente para testes
    var sectionsNames = ["Rock","Clássicos","Musicais"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        //Somente para testes - Setando os valores de categoria - SALVANDO DADOS NO FIREBASE
        self.ref = Database.database().reference()
        
     
        
        
        //DAO.retrieveAllData(ref: self.ref, completionHandler: )
        DAO.retrieveAllData(ref: self.ref) { (categoriasLista) in
            print("AQUI CARALHO.....")
            print("Quantidade do caralho das categorias: \(categoriasLista?.count)")
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
        return self.sectionsNames.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sectionsNames[section]
        return section
    }
    

    
    
    //MARK: collectionView datasource and delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        return collectionCell
    }
    
    
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: ((self.view.frame.size.width/2) + 16), height: 450)
//    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 192, height: 210)
//    }
//    

}

