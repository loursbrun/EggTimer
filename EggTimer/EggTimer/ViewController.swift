//
//  ViewController.swift
//  EggTimer
//
//  Created by fabien brun on 01/07/2017.
//  Copyright © 2017 fabien brun. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerInfo: [String] = []
    var tempsCuisson: Int = 0
    var timer:Timer = Timer()
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    var estActif:Bool = false
    
    
    
    //outlest
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //actions
    @IBAction func activerMinuteurAction(_ sender: Any) {
        compteur()
    }
    @IBAction func resetMinuteurAction(_ sender: Any) {
        resetCompter()
    }
    
    
    func selectionnerCuisson(selection: Int) {
        switch selection {
        case 0:
            tempsCuisson = 600
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        case 1:
            tempsCuisson = 10
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
        activerMinuteurBtn.isEnabled = true
        activerMinuteurBtn.alpha = 1
        minuteurLabel.textColor = UIColor.black
    }
    
    func minuteurString(temps: Int) -> String {
        let heure = Int(temps) / 3600
        let minutes = Int(temps) / 60 % 60
        let seconde = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heure, minutes, seconde)
    }
    
    
    func compteur() {
        if(!estActif){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementer), userInfo: nil, repeats: true)
            timer.fire()
            activerMinuteurBtn.setTitle("Stop", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
            estActif = true
        } else {
        timer.invalidate()
            activerMinuteurBtn.setTitle("Démarer", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            estActif = false
        }
    }
    
    func incrementer() {
        if( tempsCuisson == 0) {
            timer.invalidate()
            minuteurLabel.text = "00:00:00"
            activerMinuteurBtn.setTitle("Démarer", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            
            minuteurLabel.textColor = UIColor.green
            
            activerMinuteurBtn.isEnabled = false
            activerMinuteurBtn.alpha = 0.3

            lecteur.play()
        } else {
            
        }
        tempsCuisson -= 1;
        minuteurLabel.text = minuteurString(temps: tempsCuisson)
    }
    
    func resetCompter() {
        timer.invalidate()
        tempsCuisson = 0
        minuteurLabel.text = "00:00:00"
        activerMinuteurBtn.setTitle("Démarer", for: UIControlState.normal)
        activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        estActif = false
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    
    //AVAudioPlayer
    
    func alarm() {
        let fichier = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        do {
            try lecteur = AVAudioPlayer(contentsOf: URL(string: fichier!)!)
        } catch {
            print("erreur lecture fichier MP3")
        }
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
        
        activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        alarm()
    }

  
}

