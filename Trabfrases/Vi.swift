//
//  Vi.swift
//  Trabfrases
//
//  Created by userext on 16/05/23.
//

import Foundation


func menu (){
    let viewmodel: ViewModel = ViewModel()
    viewmodel.decodar()
    
    while (option.option != "5"){
        
        print("-----BEM VINDO:-----\n Digite 1 para gerar uma nova frase:\n Digite 2 para adicionar uma frase:\n Digite 3 para remover uma frase:\n Digite 4 para listar as frases:\n Digite 5 para sair do app:\n")
        
        
        
        if let estranho: String = readLine(){
            option.option = estranho
            
        }
        
        switch option.option {
        case "1":
            viewmodel.gerarFrase()
        case "2":
            viewmodel.adicionarFrase()
        case "3":
            viewmodel.removerFrase()
        case "4":
            viewmodel.listarFrase()
        case "5":
            break
        default:
            print("Opção inválida")
        }
    }
}
