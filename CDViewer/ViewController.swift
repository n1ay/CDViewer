//
//  ViewController.swift
//  CDViewer
//
//  Created by Użytkownik Gość on 10.10.2017.
//  Copyright © 2017 Kamil Kos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var CDdata: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData(){
        let urlString = URL(string: "https://isebi.net/albums.php")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let usableData = data {
                        jsonObject(with data: data,
                                   options opt: JSONSerialization.ReadingOptions = [])
                        print(usableData) //JSONSerialization
                    }
                }
            }
            task.resume()
        }
    }
}

