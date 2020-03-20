//
//  ViewController.swift
//  SemOra
//
//  Created by Hélio Oliveira Silva on 02/03/20.
//  Copyright © 2020 Hélio Oliveira Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // variaveis
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var viewResposta: UIView!
    private var timePicker: UIDatePicker?
    private var datePicker: UIDatePicker?
    //   private var datePicker: UIDatePicker?
    
    
    
    
    
    var pagina:Int = 01
    var lista: [String] = ["Quantas horas você está devendo?","Qual sua carga horária diária?", "Quantas horas a mais você pretende trabalhar por dia?", "Em quantos dias você precisa zerar seu banco de horas?"]
    var respostas: [String] = []
    
    // funcoes
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "0" + String(pagina) + "."
        questionLabel.text = lista[pagina - 1]
        viewResposta.isHidden = true
        answerTextField.delegate = self
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == answerTextField {
            
            if answerTextField.text != "" {
                buttonNext.backgroundColor = UIColor(red: CGFloat(93)/255, green: CGFloat(169)/255, blue: CGFloat(248)/255, alpha: 1)
                
            } else {
                
                buttonNext.backgroundColor = UIColor(red: CGFloat(144)/255, green: CGFloat(144)/255, blue: CGFloat(144)/255, alpha: 1)
            
            }
            
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    @objc  func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        answerTextField.text = dateFormatter.string(from: datePicker.date)
        
    }
    
    @objc func dateTrueChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        answerTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    
    @IBAction func proximo() {
        pagina = pagina + 1
        buttonNext.backgroundColor = UIColor(red: CGFloat(144)/255, green: CGFloat(144)/255, blue: CGFloat(144)/255, alpha: 1)
        
        
        if pagina <= 4 {
            titleLabel.text = "0" + String(pagina) + "."
            questionLabel.text = lista[pagina - 1]
            respostas.append(answerTextField.text!)
            answerTextField.text = nil
            
        }
        if pagina == 4 {
            
            buttonNext.setTitle("CALCULAR", for: .normal)
            
            datePicker = UIDatePicker()
            datePicker?.datePickerMode = .date
            datePicker?.locale = Locale(identifier: "pt_BR")
            datePicker?.addTarget(self, action:
                #selector(ViewController.dateTrueChanged(datePicker:)), for: .valueChanged)
            answerTextField.inputView = datePicker
            
            
        }
        if pagina == 5 {
            buttonNext.setTitle("REFAZER", for: .normal)
            respostas.append(answerTextField.text!)
            answerTextField.text = nil
            
            viewResposta.isHidden = false
            
        }
        
        if pagina == 6 {
            
            pagina = 1
            
            titleLabel.text = "0" + String(pagina) + "."
            questionLabel.text = lista[pagina - 1]
            buttonNext.setTitle("PRÓXIMO", for: .normal)
            viewResposta.isHidden = true
                
        }
        
        if pagina == 2 {
            timePicker = UIDatePicker()
            timePicker?.datePickerMode = .countDownTimer
            timePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
            answerTextField.inputView = timePicker

            
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
            view.addGestureRecognizer (tapGesture)
            
            
        }
        print (respostas)
        
    }
    
}
