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

