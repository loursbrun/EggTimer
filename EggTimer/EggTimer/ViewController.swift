//
//  ViewController.swift
//  EggTimer
//
//  Created by fabien brun on 01/07/2017.
//  Copyright © 2017 fabien brun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlest
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    @IBOutlet weak var pickerViewSelectionCuisson: UIPickerView!
    
    //actions
    @IBAction func activerMinuteurAction(_ sender: Any) {
    }
    @IBAction func resetMinuteurAction(_ sender: Any) {
    }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

