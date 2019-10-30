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
    
    var ref = DatabaseReference.init() //referencia para o banco de dados firebase
    let rootRef = "ListaCategorias"
    
    
    //Funcao para salvar dados no firebase
    func saveFIRData(categoria: Categoria){
        
        //Criando um dicionario com os dados do objeto categoria
        let dataDic = ["NomeCategoria" : categoria.nome, "bannersURLs" : categoria.bannersURL] as [String : Any]
    
        //salvando os dados propriamente ditos
        self.ref.child(self.rootRef).setValue(dataDic)
    }
    
    
    
    //Inicializadores
    init() {
        self.ref = Database.database().reference()
        
    }
    
    
    
}
