//
//  Categoria.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 30/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation

class Categoria{
    
    var nome: String?
    var bannersURL: [String]?    
    
    //construtor - init
    init(nome: String?, bannersURL: [String]?) {
        self.nome = nome
        self.bannersURL = bannersURL
    }
    
    
    //default init - sem parametros
    init() {
        
    }
    
    func toString(){
        print("Dados desta categoria...")
        print("Nome: \(self.nome)")
        print("Numero de banners: \(self.bannersURL?.count)")
        print("Banners: \(self.bannersURL)")
    }
}



