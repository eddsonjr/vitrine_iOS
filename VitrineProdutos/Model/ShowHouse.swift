//
//  ShowHouse.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 11/11/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation


class ShowHouse {
    
    var id: String?
    var name: String?
    var address: Address?
    var contactPhones: [String]?
    
    
    //default init
    init() {}
    
    
    //init with parameters
    init(id: String?, name: String?,address: Address?, contactPhones: [String]?){
        self.id = id
        self.name = name
        self.address = address
        self.contactPhones = contactPhones
    }
    
    
    
    
    
}
