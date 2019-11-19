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
        var listOfData: Array<Categorie>? = []
        self.firestoreDB.collection(collectionName).getDocuments { (querySnapshot,error) in
            if let error = error {
                print(self.TAG + "Error getting documents: \(error)")
            }
            else {
                for document in querySnapshot!.documents {
                    
                    var categorie: Categorie = Categorie()
                    
                    let nameOfCategory = document.data()["name"] as! String
                    let listOfShowsID = document.data()["showsID"] as! [String]
                    
                    print(self.TAG + "Nome da categoria: \(nameOfCategory)")
                    print(self.TAG + "Lista de shows nessa categoria: \(listOfShowsID.count)")
                    
                    self.getShows(listOfShowsID: listOfShowsID, completionHandler: { (showList) in
                        print(self.TAG + "Baixando dados dos shows")
                        categorie.name = nameOfCategory
                        categorie.shows = showList
                        listOfData?.append(categorie)
                        
                    })
                }
                
//                DispatchQueue.main.async {
//                    completionHandler(listOfData!)
//                }
                
                }
            
            print(self.TAG + "shows baixados: \(listOfData?.count)")
            
            }
        
        
       
        
            
        
    }
    
    
    
    
    
    
    
    
    func getShows(listOfShowsID:[String],completionHandler: @escaping ([Show]) -> ()){
        
        
        var listOfShows: [Show]? = []
        
        for show in listOfShowsID {
            let path = "/shows/"+show
            let showDocument = self.firestoreDB.document(path)
            
            showDocument.getDocument(completion: { (querySnapshot, error) in
                let showDataImgUlr = querySnapshot?.data()!["imgUrl"] as! String
                print(self.TAG + "url de imagem deste show: \(showDataImgUlr)")
                let show: Show = Show()
                show.imageUrl = showDataImgUlr
                listOfShows?.append(show)
            })
            
        }
        
        DispatchQueue.main.async {
            completionHandler(listOfShows!)
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
