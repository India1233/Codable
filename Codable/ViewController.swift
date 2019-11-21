//
//  ViewController.swift
//  Codable
//
//  Created by Suresh Shiga on 21/11/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Employee.getData { (result) in
            switch result {
            case .Success(let json):
                print(json)
            case .Error(let error):
                showAlert("☠️", "\(error)")
            }
        }
    }
    
    // MARK: Alert
    
    private func showAlert(_ title:String, _ alertMessage: String) {
        let alertController = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

