//
//  ViewController+alertController.swift
//  WheatherApp
//
//  Created by Nikita on 17/5/22.
//

import UIKit

extension ViewController {
    
    func presentAlertController(withTitke title: String?, message: String?, style: UIAlertController.Style, complitionHandler: @escaping (String) -> Void  ) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let cities = ["San Francisco", "Moscow", "New York", "China", "Stambul", "Viena"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                complitionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
}
