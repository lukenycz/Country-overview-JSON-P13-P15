//
//  DetailViewController.swift
//  Country-overview-JSON-P13-P15
//
//  Created by Łukasz Nycz on 04/08/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var funFactText: UITextView!
    
    var nameCountry:String = " "
    var descriptionCountry:String = ""
    var currencyCountry:String = ""
    var populationCountry:Double = 0.0
    var funFactCountry:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Name: \(nameCountry)"
        descriptionText.text = "Description: \(descriptionCountry)"
        currencyLabel.text = "Currency: \(currencyCountry)"
        populationLabel.text = "Population: \(populationCountry)"
        funFactText.text = "Fun fact: \(funFactCountry)"
        print(nameCountry)
    }

}
