//
//  VM.swift
//  Trabfrases
//
//  Created by userext on 16/05/23.
//

import Foundation

class ViewModel {
    // protocolo é conjunto de regras que indica que quem assina o protocolo tem que implementar as regras
    static let fileManager = FileManager.default
    // static é pra acessar sem instanciar ("acesso global") n muda com instancia
  static  var documentsDirectory: URL {
        return ViewModel.fileManager.urls(for: .documentDirectory, in: .allDomainsMask).first!
    }
   static var jsonURL: URL {
       return ViewModel.documentsDirectory.appendingPathComponent("strings.json")
    }
    
    
    func decodar () {
        let decoder = JSONDecoder()
        do {
            
            let dado = try Data(contentsOf: ViewModel.jsonURL)
            let objectDecode = try decoder.decode(Phrase.self, from: dado)
            frases.phrases = objectDecode.frases
        } catch{
            print("Não deu")
        }
    }
    //encode
    var fraseescrita = Respostas(option: "")

    //var frasenew = Phrase(frase: [frasesNovas])
    func salvar(frases: Phrase) {

        let encoder = JSONEncoder()
        do {
            let frasenewJSONData = try encoder.encode(frases)
            try frasenewJSONData.write(to: ViewModel.jsonURL)
        }  catch{
            print("erro")
        }
    }
    //func:

    func adicionarFrase(){
        // private func so existe dentro da func
        // public so oq view precisa ver
        while option2.option != "c" {
            print("Digite 'a' para adicionar uma frase 'b' para salvar e 'c' para sair")
            if let carat = readLine() {
                option2.option = carat
            }
            switch option2.option.lowercased() {
            case "a":
                print("Escreva:")
                   if let frasesNova = readLine(), !frasesNova.isEmpty {
                    if frasesNova != ""{
                        frasesNovas.phrases.append(frasesNova)

                    }
                    else {
                        print( "Nenhuma frase foi digitada")
                        break
                    }
                }
            case "b":
                frases.phrases.append(contentsOf: frasesNovas.phrases)
                salvar(frases: Phrase(frases: frases.phrases))
                print("A frases salvas")
            case "c":
                break
            default:
                print("opção incorreta")
            }
        }
    }

    func gerarFrase (){
        guard let fraseAleatorio = frases.phrases.randomElement() else { return }
        print(fraseAleatorio)
    }

    func removerFrase(){
        print("\(frases)")
        print("Digite a frase que quer remover:")

        if let frasetirar = readLine() {
            if frases.phrases.contains(frasetirar) {
                fraseRetirar.option = frasetirar
                guard let index = frases.phrases.firstIndex(of: "\(fraseRetirar)")
                     //   var indexRetirar = index
                else { return }
                // thorw trata erros de maneira "sofisticada" tipo com enumns
               var indexRetirar = index
                frases.phrases.remove(at: indexRetirar)

            }
            else{
                print("A frase não existe")
            }
        }
        salvar(frases: Phrase(frases: frases.phrases))

    }


    func listarFrase(){
        frases.phrases.forEach{ phraseve in
           print (phraseve)
        }
    }

       

    
}

