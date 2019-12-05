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
    
    
    
    func retrieveAllShowsInCategorie(documentRef:CollectionReference, completionHandler: @escaping ([Any?]) -> ()){
        var listOfData: [Show] = []
        documentRef.getDocuments(){ (innerSpanshot,error) in
            if let error = error {
                print(self.TAG + "Erro ao adiqurir documentos dos shows...: \(error)")
            }else{
                for document in (innerSpanshot?.documents)! {
                    print(self.TAG + "Pegando os shows dentro da categoria...")
                    print(self.TAG + "Doc: \(document.documentID) => \(document.data())")
                    var s: Show = Show()
                    s.id = document.documentID
                    
                    listOfData.append(s)
                }
            }
            DispatchQueue.main.async {
                completionHandler(listOfData)
            }
            
        }
    }
    
    
    func retrieveAllCategories(completionHandler: @escaping ([Any?]) -> ()){
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
                    
                    
                    self.retrieveAllShowsInCategorie(documentRef: showsInsideCategorieRef) {(shows) in
                        print(shows.count)
                        categorie.shows = shows as! [Show]
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
    
