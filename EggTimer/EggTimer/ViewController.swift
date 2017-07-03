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
    
    
    //outlest
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //actions
    @IBAction func activerMinuteurAction(_ sender: Any) {
    }
    @IBAction func resetMinuteurAction(_ sender: Any) {
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
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datasource + delegate
        pickerView.dataSource = self
        pickerView.delegate = self
        
        for i in 0...8{
            let row = "option \(i)"
            pickerInfo.append(row)
        }
        
        
    }

  
}

