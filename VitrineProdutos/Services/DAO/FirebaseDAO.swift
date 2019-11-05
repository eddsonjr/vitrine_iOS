//
//  FirebaseDAO.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 30/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation
import Firebase


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
    
        
        var categoriaList: Array<Categoria>?
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() {
                print("ERROR: Data not found")
                return }
            
            let jsonFromFirebase = snapshot.value!
            
            print(self.TAG)
            print(jsonFromFirebase)
            print(self.TAG + "\(snapshot)")
            
            //Realizando a codificacao de json to object
            if let arrayData = snapshot.value as? [[String: Any]] {
                for valueInArray in arrayData {
                    let categoriaNome = valueInArray["NomeCategoria"] as! String ?? nil
                    let bannersUrls = valueInArray["bannersURLs"] as! [String] ?? nil
                    
                    //Somente cria um objeto do tipo categoria se o nome e a lista de banners nao for null
                    if((categoriaNome != nil) && (bannersUrls != nil)) {

                        //Criando um objeto com os dados retornados do banco de dados
                        var categoria = Categoria(nome: categoriaNome, bannersURL: bannersUrls)
                        
                        //adicionando o objeto a lista de categorias
                        categoriaList?.append(categoria)
                        
                    }
                }
                DispatchQueue.main.async {
                    completionHandler(categoriaList)
                }
            }
            
        })
    }
    
    
    
    
    
    
    
    
    
}
