//
//  ViewController.swift
//  6_1Lab
//
//  Created by Ilari Marjamaa on 01/10/2019.
//  Copyright © 2019 Ilari Marjamaa. All rights reserved.
//

import UIKit
//import PlaygroundSupport

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var JSONParseri : JSONParser!
    
    @IBAction func getButton(_ sender: Any) {
        
        let kapunki = textField.text!
        
        let urler = "https://api.openweathermap.org/data/2.5/weather?q=" + kapunki + "&APPID=65dbec3aae5e5bf9000c7a956c8b76f6"
        
        JSONParseri.getDatTempPls(urlest: urler)
        
        let x:String = String(format:"%f", JSONParseri.temperature)
        
        tempLabel.text = x
        weatherLabel.text = String(JSONParseri.currentWeather)
        
        let url = URL(string: "https://openweathermap.org/img/w/" + String(JSONParseri.iconID) + ".png")
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //PlaygroundPage.current.needsIndefiniteExecution = true
        
        JSONParseri = JSONParser()
        
    }

    

}

