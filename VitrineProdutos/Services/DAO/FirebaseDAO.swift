//
//  FirebaseDAO.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 30/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation
import Firebase
import UIKit


class FirebaseDAO {
    
    let TAG = "[FirebaseDAO]: "
    let rootRef = "ListaCategorias"

    //Funcao para salvar dados no firebase
    func saveFIRData(categoria: Categoria, ref: DatabaseReference){
        
        //Criando um dicionario com os dados do objeto categoria
        let dataDic = ["NomeCategoria" : categoria.nome, "bannersURLs" : categoria.bannersURL] as [String : Any]
    
        //salvando os dados propriamente ditos
        ref.child(self.rootRef).childByAutoId().setValue(dataDic)
        //sem o childByAutoID, ha a sobrescrita de dados
    }
    
    
    
    
    
    
    
    //Funcao para retornar todos os dados
    func retrieveAllData(ref: DatabaseReference, completionHandler: @escaping ([Categoria]?)->()) {
    
        var categoriaList: Array<Categoria>? = []
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() {
                print(self.TAG  + "ERROR: Data not found or cannot download")
                return }
            
            let jsonFromFirebase = snapshot.value!
            print(self.TAG)
            print(jsonFromFirebase)
            
            for categoria in snapshot.children.allObjects as! [DataSnapshot] {
                //adquirindo os dados e fazendo parser
                let dict = categoria.value as? [String:Any]
                let nomeCategoria = dict!["NomeCategoria"] as! String
                let bannerURLs = dict!["bannersURLs"] as! [String]
                
                let categoria = Categoria(nome: nomeCategoria, bannersURL: bannerURLs)
                print(self.TAG + "Categoria: \(categoria.nome) | \(categoria.bannersURL)")
                
//                let imgDownloaded = self.imageDownloader(url: URL(string: bannerURLs.first!)!)
                var imgDownloaded: UIImage? = UIImage()
                let url = URL(string: "https://s3.amazonaws.com/jgdprod-blogs-us/blogs/wp-content/uploads/sites/116/2016/08/banner-geral-redes-trocas-inicio.jpg")
                imgDownloaded = self.imageDownloader(url: url!)
                
                categoriaList?.append(categoria)
            }
            
            DispatchQueue.main.async {
                completionHandler(categoriaList)
            }
        })
    }
    
    
    
    
    
    
    func imageDownloader(url: URL) -> UIImage{
        
        var img = UIImage()
        DispatchQueue.main.async {
            print("OVER HERE")
            if let data = try? Data(contentsOf: url){
                img = UIImage(data: data)!
                
            }
        }
        return img
    }
    
}
