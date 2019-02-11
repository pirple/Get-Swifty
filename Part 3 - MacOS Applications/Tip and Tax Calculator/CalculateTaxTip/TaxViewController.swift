//
//  TaxViewController.swift
//  CalculateTaxTip
//
//

import Cocoa

var publicSubTotalAmount: NSNumber = 0.00
var publicTotalAfterTax: NSNumber = 0.00
let publicFormatter = NumberFormatter()

class TaxViewController: NSViewController {
  
  @IBOutlet weak var textFieldSubTotal: NSTextField!
  @IBOutlet weak var textFieldTaxRate: NSTextField!
  @IBOutlet weak var labelTaxAmount: NSTextField!
  @IBOutlet weak var labelTotalAfterTax: NSTextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
      
      publicFormatter.numberStyle = NumberFormatter.Style.currency
      
      textAlignmentRight(textItems: [textFieldSubTotal, textFieldTaxRate, labelTaxAmount, labelTotalAfterTax])
      
      textFieldSubTotal.floatValue = 0.00
      
      textFieldTaxRate.floatValue = 5.00
      
      labelTaxAmount.stringValue = "$" + String(format: "%.2f", 0.00)
      
      labelTotalAfterTax.stringValue = "$" + String(format: "%.2f", 0.00)
    }
    
  @IBAction func calculateTaxButtonClicked(_ sender: NSButton) {
    
    publicSubTotalAmount = textFieldSubTotal.floatValue as NSNumber  // used for formatting
    
    let floatSubTotalAmount = textFieldSubTotal.floatValue
    
    let floatTaxRate = textFieldTaxRate.floatValue
    
    let floatTaxAmount = floatSubTotalAmount * floatTaxRate / 100
    
    let numberTaxAmount = floatTaxAmount as NSNumber  // used for formatting
    
    labelTaxAmount.stringValue = publicFormatter.string(from: numberTaxAmount)!
    
    let numberTotalAfterTaxAmount = (floatTaxAmount + floatSubTotalAmount) as NSNumber  // used for formatting
    
    publicTotalAfterTax = numberTotalAfterTaxAmount
    
    labelTotalAfterTax.stringValue = publicFormatter.string(from: numberTotalAfterTaxAmount)!
    
  }
  
  //  set text alignment to the right for text fields and labels
  private func textAlignmentRight(textItems: [NSControl]) {
    for textItem in textItems {
      textItem.alignment = NSTextAlignment.right
    }
  }
  
}


// Stack View

// Stack View
// Group together UI elements to be as one element in the layout
// Easier to organize UI elements when grouped together into a stack view
// Adjustments to spacing within stack view






















// Position Contraints
// Size Constraints
// Align Constraints

//Position Constraints

// Leading - constraint on the leading edge (left-side edge) of the selected UI element (view) to the closest other UI element on that side.

// Trailing - constraint on the trailing edge (right-side edge) of the selected UI element (view) to the closest other UI element on that side.

// Top - constraint on the top edge of the selected UI element (view) to the closest other UI element on the top side.

// Bottom - constraint on the bottom edge of the selected UI element (view) to the closest other UI element on the bottom side.



// Top left corner = top leading

// Top right corner = top trailing

// Bottom left corner = bottom leading

// Bottom right corner = bottom trailing


// Size Constraints

// Width - keep the same width of the selected view or UI element.

// Height - keep the same height of the selected view or UI element.

// Equal Width - keep the width of the selected view equal to width of another view or UI element.

// Equal Height - keep the height of the selected view equal to height of another view or UI element.

// Aspect Ratio - keep the same proportion between height and width.
















// Align Constraints

// Horizonal - align selected UI element (view) to the horizontal center of the view it is contained in

// Vertical - align selected UI element (view) to the vertical center of the view it is contained in



















