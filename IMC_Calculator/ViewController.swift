//
//  ViewController.swift
//  IMC_Calculator
//
//  Created by iOSLab on 02/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var StatusViewer: UILabel!
    
    @IBOutlet weak var Peso: UITextField!
    
    @IBOutlet weak var Altura: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CalcularButton(_ sender: Any) {
     
        
        func calcularIMC() {
            
    // --- Verificar se os valores dos campos são Nil: --
            guard
                let pesoTexto = Peso.text,
                let alturaTexto = Altura.text
            else {
                print("Os campos de peso e altura estão vazios.")
                return
            }
            
    // --- Fazer a conversão segura dos campos de .text para Double --
            guard
                let peso = Double(pesoTexto),
                let altura = Double(alturaTexto)
            else {
                print("Os valores inseridos para peso ou altura não são válidos.")
                return
            }
            
            // Calculo IMC
            let imc = peso / (altura * altura)
            // Definição do IMC
            var status: String

            // Calcular a categoria do IMC -> Bom, Acima do Peso e etc
            switch imc {
            case 0.0...18.5:
                status = "Abaixo do peso"
                StatusViewer.textColor = .systemOrange
                
            case 18.6...24.9:
                status = "Peso ideal"
                StatusViewer.textColor = .systemGreen
                
            case 25.0...29.9:
                status = "Acima do peso"
                StatusViewer.textColor = .systemOrange
                
            case 30.0...34.9:
                status = "Obesidade I"
                StatusViewer.textColor = .systemRed
                
            case 35.0...39.9:
                status = "Obesidade II"
                StatusViewer.textColor = .systemRed
                
            case 40.0:
                status = "Obesidade Mórbida"
                StatusViewer.textColor = .systemRed
                
            default:
                status = "Peso Não Encontrado!"
                StatusViewer.textColor = .systemBlue

            }

            // Exibir o status do IMC
            StatusViewer.text = String(format: "Seu IMC é de %.1f - %@", imc, status)

        
            
        }

        
        calcularIMC()

        
        
        /*
        switch : categoria{
        case abaixo:
            break;
        case bom:
            break;
        case acima:
            break;
        case obeso:
            break;
        case obesoII:
            break;
        }
        
        */
    }
    
    
    
    
}

