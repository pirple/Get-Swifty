//
//  ViewController.swift
//  UIAlertController Intro
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var alertController = UIAlertController()
    
    var listOfUsers = ["Nimish"]
    var listOfPasswords = ["password"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressButton1(_ sender: UIButton) {
        alertController = UIAlertController(title: "Alert 1", message: "Here is a new alert for you", preferredStyle: .alert)
        present(alertController, animated: true, completion: {() -> Void in
            print("Alert is being displayed")
        })
        
        let delay = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {() -> Void in
            self.alertController.dismiss(animated: true, completion: {() -> Void in
                print("Alert is being dismissed")
            })
        })
    }
    
    @IBAction func pressButton2(_ sender: UIButton) {
        alertController = UIAlertController(title: "Alert!", message: "Here is an alert with actions", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: {(ACTION: UIAlertAction) -> Void in
            print("Alert with actions has been dismissed")
        })
        let blueAction = UIAlertAction(title: "Blue", style: .default, handler: {(ACTION: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.blue
        })
        let redAction = UIAlertAction(title: "Red", style: .default, handler: {(ACTION: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.red
        })
        alertController.addAction(cancelAction)
        alertController.addAction(blueAction)
        alertController.addAction(redAction)
        
        alertController.preferredAction = blueAction
        
        present(alertController, animated: true, completion: {() -> Void in
            print("Alert with actions is being displayed")
        })
    }
    
    @IBAction func pressButton3(_ sender: UIButton) {
        alertController = UIAlertController(title: "Login", message: "Enter username and password", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(ACTION: UIAlertAction) -> Void in
            print("Login has been cancelled")
        })
        let loginAction = UIAlertAction(title: "Login", style: .default, handler: {(ACTION: UIAlertAction) -> Void in
            guard let textFields = self.alertController.textFields else { print("No text fields on alert controller"); return }
            guard let usernameText = textFields[0].text else { print("No username entered"); return }
            guard let passwordText = textFields[1].text else { print("No password entered"); return }
            if usernameText == self.listOfUsers[0] && passwordText == self.listOfPasswords[0] {
                print("Login successful")
                self.label1.text = "Welcome \(self.listOfUsers[0])"
                self.label2.text = "Current password: \(self.listOfPasswords[0])"
                return
            } else {
                print("Incorrect username or password")
                self.label1.text = "Incorrect username or password"
                self.alertController.dismiss(animated: true, completion: nil)
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(loginAction)
        alertController.preferredAction = loginAction
        
        alertController.addTextField(configurationHandler: {(TEXTFIELD: UITextField) -> Void in
            TEXTFIELD.placeholder = "Username here"
            TEXTFIELD.autocapitalizationType = .sentences
        })
        alertController.addTextField(configurationHandler: {(TEXTFIELD: UITextField) -> Void in
            TEXTFIELD.placeholder = "Password here"
            TEXTFIELD.isSecureTextEntry = true
        })
        
        alertController.view.backgroundColor = UIColor.green
        
        present(alertController, animated: true, completion: {() -> Void in
            print("User is trying to login")
        })
    }
    
    @IBAction func pressButton4(_ sender: UIButton) {
        alertController = UIAlertController(title: "Alert 2", message: "Here is alert2's text", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: {(ACTION: UIAlertAction) -> Void in
            print("Alert with actions has been dismissed")
        })
        let blueAction = UIAlertAction(title: "Blue", style: .default, handler: {(ACTION: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.blue
        })
        let redAction = UIAlertAction(title: "Red", style: .default, handler: {(ACTION: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.red
        })
        alertController.addAction(cancelAction)
        alertController.addAction(blueAction)
        alertController.addAction(redAction)
        
        present(alertController, animated: true, completion: {() -> Void in
            print("Action sheet is being displayed")
        })
        /*alertController.dismiss(animated: true, completion: {() -> Void in
            print("Action sheet is being dismissed")
        })*/
    }
    
}

