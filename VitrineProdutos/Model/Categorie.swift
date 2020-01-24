//
//  Categoria.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 30/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation

class Categorie{
    
    var id: String?
    var name: String?
    var shows: [Show]?
    

    //default init - sem parametros
    init() {}
    
    
    //init com parametros
    init(id: String?, name: String?,shows:[Show]?){
        self.id = id
        self.name = name
        self.shows = shows
    }
    
    
    
}



