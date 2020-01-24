//
//  Address.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 11/11/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation


class Address {
    
    var id: String?
    var zip: String?
    var street: String?
    var neighborhood: String?
    var number: String?
    var city: String?
    var referencePlace: String?
    var longitude: Double?
    var latitude: Double?
    
    
    //default init
    init() {}
    
    
    
    //init with parameters
    init(id: String?,zip: String?,street: String?,neighborhood:String?,number:String,city:String?,referencePlace:String?,longitude:Double?,latitude:Double?) {
        self.id = id
        self.zip = zip
        self.neighborhood = neighborhood
        self.street = street
        self.number = number
        self.city = city
        self.referencePlace = referencePlace
        self.longitude = longitude
        self.latitude = latitude
    }
    
    
    

    
}
