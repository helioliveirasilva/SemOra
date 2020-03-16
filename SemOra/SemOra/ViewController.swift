//
//  ViewController.swift
//  SemOra
//
//  Created by Hélio Oliveira Silva on 02/03/20.
//  Copyright © 2020 Hélio Oliveira Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variaveis
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet weak var answerTextField: UITextField!
 //   private var datePicker: UIDatePicker?

    
    
    
    
    var pagina:Int = 01
    var lista: [String] = ["Quantas horas você está devendo?","Qual sua carga horária diária?", "Quantas horas a mais você pretende trabalhar por dia?", "Em quantos dias você precisa zerar seu banco de horas?"]
    var respostas: [Int] = []
    
    // funcoes
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        titleLabel.text = "0" + String(pagina) + "."
        questionLabel.text = lista[pagina - 1]
        
//        datePicker = UIDatePicker()
//        datePicker?.datePickerMode = .time
//        datePicker? .addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
//
//        view.addGestureRecognizer(tapGesture)
        
//        answerTextField.inputView  = datePicker
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
//
//
//    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
//        view.endEditing(true)
//
//    }
//
//    @objc func dateChanged(datePicker: UIDatePicker) {
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "hh:mm"
//        answerTextField.text = dateFormatter.string(from: datePicker.date)
//
//    }
    
   
    
    @IBAction func proximo() {
        pagina = pagina + 1
     
        
        if pagina <= 4 {
            titleLabel.text = "0" + String(pagina) + "."
            questionLabel.text = lista[pagina - 1]
            respostas.append(Int(answerTextField.text!)!)
            print (respostas)
            answerTextField.text = nil
        }
        if pagina == 4 {
            buttonNext.setTitle("CALCULAR", for: .normal)
        }
        if pagina > 4 {
            respostas.append(Int(answerTextField.text!)!)
               answerTextField.text = nil
           
            var final = Int(respostas[0]) / Int(respostas[3])
            
            var stringFinal = String("Você tem " + String(final) + " dias para zerar seu banco de horas")
            let alert = UIAlertController(title: stringFinal  , message: "Cuidado pra não ser demitido", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Recalcular", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
    }
    
}
