//
//  ViewController.swift
//  Country-overview-JSON-P13-P15
//
//  Created by Łukasz Nycz on 04/08/2021.
//

import UIKit

class ViewController: UITableViewController {

    var country:Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemRed
        parseJson()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return country?.country[section].name.count ?? 0
        return country?.country.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = country?.country[indexPath.row].name
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController {
            let countryDetail = country?.country[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
            print(countryDetail!)
            vc.nameCountry = countryDetail?.name ?? ""
            vc.descriptionCountry = countryDetail?.description ?? ""
            vc.currencyCountry = countryDetail?.currency ?? ""
            vc.populationCountry = countryDetail?.population ?? 0.0
            vc.funFactCountry = countryDetail?.funFact ?? ""
            
        }
    }
    private func parseJson() {
        guard let path = Bundle.main.path(
                forResource: "country",
                ofType: "json"
        ) else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
        let jsonData = try Data(contentsOf: url)
            country = try JSONDecoder().decode(Country.self, from: jsonData)
        } catch {
            print("Error: \(error)")
        }
    }
}

