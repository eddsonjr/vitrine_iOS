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
    
    
    
    func retrieveSnapshotsDocuments(collectionName: String) -> [DocumentSnapshot] {
        print(self.TAG + "Getting document snapshtos...")
        var documents: [DocumentSnapshot] = []
        self.firestoreDB.collection(collectionName).getDocuments{ (querySnapshot,error) in
            if let error = error {
                print(self.TAG + "Error getting documents snapshots: \(error)")
            }else {
                documents = (querySnapshot?.documents)!
            }
        }
        return documents
    }
    
    
    
    
    
    func retrieveAllCategories(completionHandler: @escaping ([Any?]) -> ()){
        //pegando os documentos atraves da funcao retrieveSnapshotsDocuments
        var listDocuments = retrieveSnapshotsDocuments(collectionName: "categories")
        var listOfCategories: [Categorie] = []
        
        for document in listDocuments{
            var categorie: Categorie = Categorie()
            let nameOfCategory = document.data()!["name"] as! String
            listOfCategories.append(categorie)
        }
        DispatchQueue.main.async {
            print(self.TAG + "Retornando com a lista de categorias")
            completionHandler(listOfCategories)
        }
    }
    
    
    
    
    
    func retrieveAllData(completionHandler: @escaping ([Any?]) -> ()){
        var listOfData: [Categorie] = []
        self.firestoreDB.collection("categorie").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(self.TAG + "Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                }
                DispatchQueue.main.async {
                    completionHandler(listOfData)
                }
            }
        }
        
        
    }
}
    
