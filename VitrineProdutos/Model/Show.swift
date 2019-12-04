//
//  Show.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 11/11/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation


class Show {
    
    var id: String?
    var imageUrl: String?
    var startDate: String?
    var endDate: String?
    var showHouse: ShowHouse?
    
    
    //default init
    init() {}
    
    
    //init with parameters
    init(id: String?,imageUrl: String?, startDate: String?, endDate: String?, showHouse: ShowHouse?){
        self.id = id
        self.imageUrl = imageUrl
        self.startDate = startDate
        self.endDate = endDate
        self.showHouse = showHouse
    }
    
}
