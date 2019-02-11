//
//  ViewController.swift
//  XCode Intro
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayLabel.backgroundColor = UIColor.red
        
        var string1 : String = "hello"
        
        //string1 = "hi"
        
        print(string1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeTextAction(_ sender: UIButton) {
        displayLabel.text = "Mammoth Interactive is my favourite company :)"
    }
    
}

