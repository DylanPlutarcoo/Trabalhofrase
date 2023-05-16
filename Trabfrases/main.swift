import Foundation

import Foundation
//Declarações :
var indexRetira: Int = -11
var option: String = "-5"
var option2: String = ""
var fraseretirar: String = ""
var frases: [String] = []
var frasesNovas: [String] = [""]


//Decoder/jso
struct Phrase: Codable {
    var frases: [String]
}

let fileManager = FileManager.default
let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .allDomainsMask).first!

let jsonURL = documentsDirectory.appendingPathComponent("strings.json")


let decoder = JSONDecoder()
do {
    
    let dado = try Data(contentsOf: jsonURL)
    let objectDecode = try decoder.decode(Phrase.self, from: dado)
    frases = objectDecode.frases
} catch{
    print("Não deu")
}
//encode
var fraseescrita: String = ""
//var frasenew = Phrase(frase: [frasesNovas])
func salvar(frases: Phrase) {
    
    let encoder = JSONEncoder()
    do {
        let frasenewJSONData = try encoder.encode(frases)
        try frasenewJSONData.write(to: jsonURL)
    }  catch{
        print("erro")
    }
}
//func:

func adicionarFrase(){
    while option2 != "c" {
        print("Digite 'a' para adicionar uma frase 'b' para salvar e 'c' para sair")
        if let carat = readLine(){
            option2 = carat
        }
        switch option2.lowercased() {
        case "a":
            print("Escreva:")
               if let frasesNova = readLine(), !frasesNova.isEmpty {
                if frasesNova != ""{
                    frasesNovas.append(frasesNova)
    
                }
                else {
                    print( "Nenhuma frase foi digitada")
                    break
                }
            }
        case "b":
            frases.append(contentsOf: frasesNovas)
            salvar(frases: Phrase(frases: frases))
            print("A frases salvas")
        case "c":
            break
        default:
            print("opção incorreta")
        }
    }
}

func gerarFrase (){
    guard let fraseAleatorio = frases.randomElement() else { return }
    print(fraseAleatorio)
}
func indexVetor (frasepraver: String) -> Int {
    guard let index = frases.firstIndex(of: "\(fraseretirar)") else {
        return -5
    }
    return index
    //    if frases.contains(fraseretirar){
    //        indexRetira = frases.firstIndex(of: "\(fraseretirar)")!
    //        return indexRetira
    //    }
    //    else {
    //        return -5
    //    }
    
}
func removerFrase(){
    print("\(frases)")
    print("Digite a frase que quer remover:")
    
    if let frasetirar = readLine() {
        if frases.contains(frasetirar) {
            fraseretirar = frasetirar
            var indexRetirar = indexVetor(frasepraver: fraseretirar)
            frases.remove(at: indexRetirar)
            
        }
        else{
            print("A frase não existe")
        }
    }
    salvar(frases: Phrase(frases: frases))
    
}


func listarFrase(){
    frases.forEach{ phraseve in
       print (phraseve)
    }
}

    //    for (index, element) in frases.enumerated() {
    //        print("\(index): \(element)")
     //  }
    
    while(option != "E" || option != "e") {
        
        gerarFrase()
        print("-----BEM VINDO:-----\n Digite a para gerar uma nova frase:\n Digite b para adicionar uma frase:\n Digite c para remover uma frase:\n Digite d para listar as frases:\n Digite e para sair do app:\n")
        print("Frase Aleatoria:")
        
        
        //    option = ((String(readLine()!)!))
        if let estranho: String = readLine(){
            option = estranho
            
        }
        
        switch option.lowercased() {
        case "a":
            gerarFrase()
        case "b":
            adicionarFrase()
        case "c":
            removerFrase()
        case "d":
            listarFrase()
        case "e":
            break
        default:
            print("Opção inválida")
        }
    }
