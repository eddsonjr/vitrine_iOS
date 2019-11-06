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
        
//        let listaBannersCategoria = self.listaDeCategorias![indexPath.row]
//        for banner in listaBannersCategoria.bannersURL! {
//            collectionCell.imageView.load(url: URL(string: banner)!)
//        }
        
        
        
        return collectionCell
    }
    
    
    
    //Funcao somente para testes()
    func saveDataOnDataBase(){
        var categoriaMusical = Categoria()
        var categoriaRock = Categoria()
        
        
        categoriaMusical.nome = "Musicais"
        categoriaMusical.bannersURL = ["https://www.panicposters.com/media/catalog/product/cache/1/image/600x887.57396449704/9df78eab33525d08d6e5fb8d27136e95/f/i/file_25_4.jpg",
            "https://www.screenmania.fr/wp-content/uploads/2011/09/Redline-jaquette-DVD.jpg"]
        
        
        categoriaRock.nome = "Rock"
        categoriaRock.bannersURL = ["https://s3.amazonaws.com/jgdprod-blogs-us/blogs/wp-content/uploads/sites/116/2016/08/banner-geral-redes-trocas-inicio.jpg"]
        
        
        //salvando no banco
        DAO.saveFIRData(categoria: categoriaMusical,ref: self.ref)
        DAO.saveFIRData(categoria: categoriaRock,ref: self.ref)
        
        
    }
}

