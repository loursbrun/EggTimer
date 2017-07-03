//
//  ViewController.swift
//  EggTimer
//
//  Created by fabien brun on 01/07/2017.
//  Copyright © 2017 fabien brun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerInfo: [String] = []
    var tempsCuisson: Int = 0
    
    
    
    //outlest
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //actions
    @IBAction func activerMinuteurAction(_ sender: Any) {
    }
    @IBAction func resetMinuteurAction(_ sender: Any) {
    }
    
    
    func selectionnerCuisson(selection: Int) {
        switch selection {
        case 0:
            tempsCuisson = 600
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        case 1:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        case 2:
            tempsCuisson = 360
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        case 3:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        case 4:
            tempsCuisson = 240
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        case 4:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        default:
             print("aucune sélection faite !")
            minuteurLabel.text = minuteurString(temps: 0)
        }
    }
    
    func minuteurString(temps: Int) -> String {
        let heure = Int(temps) / 3600
        let minutes = Int(temps) / 60 % 60
        let seconde = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heure, minutes, seconde)
    }
     
    
    //MARK - UIPickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerInfo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerInfo[row]
    }
    
    
    //MARK - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectionnerCuisson(selection: row)
    }
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datasource + delegate
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerInfo = ["Oeufs durs", "Oeuf à la coque", "Oeuf Mollet", "Oeuf cocotte", "Oeuf Poché", "Omelette baveuse"]
        
        
    }

  
}

