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
import FirebaseFirestore


class FirebaseDAO {
    
    let TAG = "[FirebaseDAO]: "
    //let rootRef = "categories"
    lazy var firestoreDB = Firestore.firestore()
    
    
    //Retrieve data from Firestore
    func retrieveData(collectionName: String!,completionHandler: @escaping ([Categorie?])->()){
        
        var listOfData: Array<Categorie>? = []
        self.firestoreDB.collection(collectionName).getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(self.TAG + "Error getting documents: \(error)")
                DispatchQueue.main.async {
                    completionHandler(listOfData!)
                }
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
                DispatchQueue.main.async {
                    completionHandler(listOfData!)
                }
            }
        }        
    }

    
}
