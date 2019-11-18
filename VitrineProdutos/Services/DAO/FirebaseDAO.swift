//
//  FirebaseDAO.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 30/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class FirebaseDAO {
    
    let TAG = "[FirebaseDAO]: "
    //let rootRef = "categories"
    lazy var firestoreDB = Firestore.firestore()
    
    
    
    
    
    
    
    //Esta funcao faz a conexao com o firestore e baixa os dados de acordo com o nome da colecao passada para a funcao.
    //jeito de acessar: defaultStore?.collection("Category").document("Film").collection("firstFilm").getDocuments();
    func retrieveData(collectionName: String!,completionHandler: @escaping ([Any?]) -> ()) {
        var listOfData: Array<Any>? = []
        //self.firestoreDB.collection(collectionName).getDocuments() { (querySnapshot,error) in
        self.firestoreDB.collection(collectionName).getDocuments { (querySnapshot,error) in
            if let error = error {
                print(self.TAG + "Error getting documents: \(error)")
            }
            else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    print(data)
                    
                    
                }
                
            }
            
            DispatchQueue.main.async {
                completionHandler(listOfData!)
            }
        }
        
    }
    
    
    
    
    
    
    func addCategorie(categorie: Categorie){
        let dict: [String : Any] = ["nome" : categorie.name]
        //criando um id para o documento com base no nome da categoria
        self.firestoreDB.collection("categorie").document(categorie.id!).setData(dict)
        
        
    }
    
    
    
    func removeCategorie(categorie:Categorie){
        self.firestoreDB.collection("categorie").document(categorie.id!).delete()
    }
    
    
    
    func retrieveCategorie(){
        self.firestoreDB.collection("categorie").document("Musicais antigos-doc").getDocument{ (document,error) in
            if let error = error {
                print(self.TAG + "Error when try to retrieve data")
                //tratamento de erros aqui
                //existe tambem a propriedade .exists associada ao documento
                //document?.exists
            }else {
                let retrieveDataDic = document?.data()
                print(retrieveDataDic)
                
            }
            
        }
    }
    

    
    
    
    
    func getAllShowsOfCategorie(categorie: Categorie){
        self.firestoreDB.collection("show").whereField("categorieName", isEqualTo:categorie.name).getDocuments{(snapshot,error) in
            let retrieveDataDic = snapshot?.documents.first?.data()
            print(retrieveDataDic)
            
        }
    }
    
    

    
    

    
}
