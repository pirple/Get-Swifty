//
//  ViewController.swift
//  MacOsElements
//
//

import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var myLabel: NSTextField!
  
  @IBOutlet weak var myTextField: NSTextField!
  
  @IBOutlet weak var myButton: NSButton!
  
  @IBOutlet weak var myPopUpButton: NSPopUpButton!
  
  @IBOutlet weak var horizontalSlider: NSSlider!
  
  @IBOutlet weak var verticalSlider: NSSlider!
  
  @IBOutlet weak var verticalSliderLabel: NSTextField!
  
  @IBOutlet weak var myImageView: NSImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myLabel.stringValue = "Hello From Kevin"
    
    myTextField.placeholderString = "Enter text please ..."
//    myTextField.backgroundColor = NSColor.cyan
//    myTextField.textColor = NSColor.brown
    myTextField.stringValue = "0"
    
    myPopUpButton.removeAllItems()
    myPopUpButton.addItems(withTitles: ["macOS", "iOS", "tvOS", "watchOS"])
    
    horizontalSlider.allowsTickMarkValuesOnly = true
    horizontalSlider.maxValue = 10.0
    horizontalSlider.minValue = 1.0
    horizontalSlider.numberOfTickMarks = 10
    horizontalSlider.floatValue = 1.0
    
    verticalSliderLabel.stringValue = "Vertical Slider value is: " + String(format: "%.1f", verticalSlider.floatValue)
    
    myImageView.image = NSImage(named: NSImage.Name(rawValue: "Mammoth-Interactive-Logo-and-Text-768x432"))
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func myButtonClicked(_ sender: NSButton) {
    var myValue = 0
    myValue = Int(myTextField.stringValue)!
    myValue += 1
    
    myTextField.stringValue = String(myValue)
    
    myLabel.stringValue = myPopUpButton.titleOfSelectedItem! + " " + String(format: "%.1f", horizontalSlider.floatValue)
    
  }
  
  @IBAction func verticalSliderChanged(_ sender: NSSlider) {
    
    verticalSliderLabel.stringValue = "Vertical Slider value is: " + String(format: "%.1f", verticalSlider.floatValue)
    
  }
  

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

