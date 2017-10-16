//
//  ViewController.swift
//  CDViewer
//
//  Created by Użytkownik Gość on 10.10.2017.
//  Copyright © 2017 Kamil Kos. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var CDdata: [Any] = []
    var actualIndex: Int = 0
    var minIndex: Int = 0
    var maxIndex: Int = 0
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var trackField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
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
                        self.CDdata = try! JSONSerialization.jsonObject(with: usableData, options: []) as! [Any];
                        self.maxIndex = self.CDdata.endIndex-1
                        self.updateTextFields()
                        self.currentTrackUpdate()
                    }
                }
            }
            task.resume()
        }
    }
    
    func updateTextFields() {
        if let CD = self.CDdata[self.actualIndex] as? [String: Any] {
            DispatchQueue.main.async {
                self.authorField.text = CD["artist"] as? String
                self.genreField.text = CD["genre"] as? String
                self.titleField.text = CD["album"] as? String
                let year = CD["year"] as? Int
                let tracks = CD["tracks"] as? Int
                self.yearField.text = String(year!)
                self.trackField.text = String(tracks!)
            }
        }
    }
    
    func currentTrackUpdate() {
        DispatchQueue.main.async {
            self.previousButton.isHidden = false
            self.nextButton.isHidden = false
            self.numberLabel.text = "\(self.actualIndex+1) z \(self.maxIndex+1)"
            if(self.actualIndex == self.minIndex) {
                self.previousButton.isHidden = true
            };
            if(self.actualIndex == self.maxIndex) {
                self.nextButton.isHidden = true
            }
        }
    }

    @IBAction func deletePressed(_ sender: Any) {
    }
    @IBAction func newPressed(_ sender: Any) {
    }
    @IBAction func savePressed(_ sender: Any) {
    }
    @IBAction func previousPressed(_ sender: Any) {
        self.actualIndex-=1
        self.updateTextFields()
        self.currentTrackUpdate()
    }
    @IBAction func nextPressed(_ sender: Any) {
        self.actualIndex+=1
        self.updateTextFields()
        self.currentTrackUpdate()
    }
}

