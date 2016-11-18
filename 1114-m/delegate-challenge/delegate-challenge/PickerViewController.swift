//
//  PickerViewController.swift
//  delegate-challenge
//
//  Created by Nikolas Burk on 07/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userSelectedData(data: String)
}

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  @IBOutlet weak var pickerView: UIPickerView!
  @IBOutlet weak var cityLabel: UILabel!
    
  var delegate: DataSentDelegate?
    
    var cities = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.pickerView.delegate = self
    self.pickerView.dataSource = self
    
    // Picker Data
    cities = ["New York", "San Francisco", "Berlin", "Hamburg", "Paris"]
  }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let citiesIndex = cities[row]
        cityLabel.text = citiesIndex
        return citiesIndex
    }
  
}
