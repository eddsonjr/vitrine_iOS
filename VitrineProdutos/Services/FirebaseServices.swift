//
//  FirebaseServices.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 02/12/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore




class FirebaseServices {
    
    let TAG = "[FirebaseDAO]: "
    lazy var firestoreDB = Firestore.firestore()
    
    
    
    func retrieveAllCategoriesData(completionHandler: @escaping ([Any?]) -> ()){
        var listOfData: [Categorie] = []
        self.firestoreDB.collection("categories").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(self.TAG + "Erro ao adiqurir documentos da categoria...: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    var categorie: Categorie = Categorie()
                    categorie.id = document.documentID
                    categorie.name = document["categorieName"] as! String
                
                    
                    
                    let showsInsideCategorieRef = self.firestoreDB.collection("categories").document(document.documentID).collection("showTest")
                
                    showsInsideCategorieRef.getDocuments(){ (innerSpanshot,error) in
                        if let error = error {
                            print(self.TAG + "Erro ao adiqurir documentos da categoria...: \(error)")
                        }else{
                            for document in (innerSpanshot?.documents)! {
                                print(self.TAG + "Pegando o show dentro da categoria...")
                                print(self.TAG + "Doc: \(document.documentID) => \(document.data())")
                            }
                        }
                        
                        
                    }
                   
                    
                    
                    listOfData.append(categorie)
                    
                }
                
            }
            DispatchQueue.main.async {
                completionHandler(listOfData)
            }
           
        }
       
        
        
    }
}
    
