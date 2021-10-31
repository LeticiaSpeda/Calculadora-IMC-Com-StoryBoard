//
//  ViewController.swift
//  IMCCurso
//
//  Created by Paolo Prodossimo Lopes on 27/10/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private var imc : Double = 0
    
    //MARK: - IBOutlets

    @IBOutlet weak private var PesoTextField: UITextField!
    @IBOutlet weak private var AlturaTextField: UITextField!
    
    @IBOutlet weak private var ResultadoIMC: UILabel!
    @IBOutlet weak private var ImagemResultado: UIImageView!
    @IBOutlet weak private var ViewResultado: UIView!
    
    //MARK: - IBActions
    
    @IBAction private func BotaoCalcular(_ sender: Any) {
        guard let pesoTFText = PesoTextField.text,
            let alturaTFText = AlturaTextField.text else { return }
        
       if let Peso =  Double(pesoTFText) ,
        let Altura = Double(alturaTFText) {
            imc = Peso / (Altura*Altura)
            ShowResults()
        }
    }
    
    //MARK: - Helpers
    
    private func ShowResults () {
        var result : String = ""
        var imagem : String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                imagem = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                imagem = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                imagem = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                imagem = "sobre"
            default:
                 result = "Obesidade"
                imagem = "obesidade"
        }
        
        ResultadoIMC.text = "\(Int(imc))  \(result)"
        ImagemResultado.image = UIImage(named:imagem)
        ViewResultado.isHidden = false
    }
    

}

