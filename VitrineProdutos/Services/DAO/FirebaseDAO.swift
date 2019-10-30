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
    
    let rootRef = "ListaCategorias"
    
    
    //Funcao para salvar dados no firebase
    func saveFIRData(categoria: Categoria, ref: DatabaseReference){
        
        //Criando um dicionario com os dados do objeto categoria
        let dataDic = ["NomeCategoria" : categoria.nome, "bannersURLs" : categoria.bannersURL] as [String : Any]
    
        //salvando os dados propriamente ditos
        ref.child(self.rootRef).setValue(dataDic)
    }
    
    
}
