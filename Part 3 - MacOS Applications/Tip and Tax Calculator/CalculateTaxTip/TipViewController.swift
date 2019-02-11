//
//  TipViewController.swift
//  CalculateTaxTip
//

import Cocoa

class TipViewController: NSViewController {

  @IBOutlet weak var labelSubTotalAmount: NSTextField!
  
  @IBOutlet weak var labelTotalAfterTaxAmount: NSTextField!
  
  @IBOutlet weak var sliderTipPercentage: NSSlider!
  
  @IBOutlet weak var labelTipPercentage: NSTextField!
  
  @IBOutlet weak var labelTipAmount: NSTextField!
  
  @IBOutlet weak var labelTotalAfterTipAmount: NSTextField!
  
  @IBOutlet weak var labelSubTotal: NSTextField!
  
  @IBOutlet weak var labelTotalAfterTax: NSTextField!
  
  @IBOutlet weak var labelTipSlider: NSTextField!
  
  @IBOutlet weak var labelTip: NSTextField!
  
  @IBOutlet weak var labelTotalAfterTip: NSTextField!
  
  @IBOutlet weak var buttonCalculateTip: NSButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    
    alignmentRight(labels: [labelSubTotalAmount, labelTotalAfterTaxAmount, labelTipAmount, labelTotalAfterTipAmount])
    
    labelTipAmount.floatValue = 0.00
    
    labelTotalAfterTipAmount.floatValue = 0.00
    
//    MARK: translatesAutoresizingMaskIntoConstraints
//    THIS IS SUPER IMPORTANT TO MAKE CONSTRAINTS WORK PROGRAMMATICALLY
//    =====================================================================
    translateAutoresizingMaskIntoConstraintsFalse(controls: [labelSubTotal,
                                                             labelSubTotalAmount, labelTotalAfterTax, labelTotalAfterTaxAmount, labelTipSlider, sliderTipPercentage, labelTip, labelTipAmount, labelTotalAfterTip, labelTotalAfterTipAmount, buttonCalculateTip])
//    =====================================================================

    setConstraintsForControls()
    
    }
  
  override func viewWillAppear() {
    
    labelSubTotalAmount.stringValue = publicFormatter.string(from: publicSubTotalAmount)!
    
    labelTotalAfterTaxAmount.stringValue = publicFormatter.string(from: publicTotalAfterTax)!
    
  }
    
  @IBAction func calculateTipButtonClicked(_ sender: NSButton) {
  
    let intTipPercentage = sliderTipPercentage.intValue
    
    let floatTipAmount = publicSubTotalAmount.floatValue * Float(intTipPercentage) / 100
    
    let numberTipAmount = floatTipAmount as NSNumber  // used for formatting to currency
    
    labelTipAmount.stringValue = publicFormatter.string(from: numberTipAmount)!
    
    let numberTotalAmountAfterTip = (floatTipAmount + publicTotalAfterTax.floatValue) as NSNumber  //used for formatting to currency
    
    labelTotalAfterTipAmount.stringValue = publicFormatter.string(from: numberTotalAmountAfterTip)!
    
  }
  
  @IBAction func tipPercentageSliderChanged(_ sender: NSSlider) {
    
    labelTipPercentage.stringValue = String(sliderTipPercentage.intValue) + "%"
    
  }
  
  private func alignmentRight(labels: [NSTextField]) {
    for label in labels {
      label.alignment = .right
    }
  }
  
  private func translateAutoresizingMaskIntoConstraintsFalse(controls: [NSControl]) {
    for control in controls {
      control.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
//  line up the top edge of a text field with the top edge of corresponding control on other side of the tip view controller
  private func topAnchorToTopAnchorConstraint(firstItem: NSTextField, secondItem: NSControl)  {
    
    firstItem.topAnchor.constraint(equalTo: secondItem.topAnchor, constant: 0).isActive = true
    
  }
  
//  set the spacing between leading edge of a control to leading edge of the view to 20
  private func leadingAnchorToLeadingAnchorConstraint(item: NSControl) {
    
    item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
    
  }
  
//  set the spacing between bottom edge of a control to the top edge of the control below it to a specified constant. this needs to be a negative constant so it has to be multiplied by -1
  private func bottomAnchorToTopAnchorConstraint(firstItem: NSControl, secondItem: NSControl, withConstant: CGFloat) {
    
    firstItem.bottomAnchor.constraint(equalTo: secondItem.topAnchor, constant: withConstant * -1).isActive = true
    
  }
  
//  set the spacing between the trailing edge of a control to the trailing edge of labelSubTotalAmount to line up with it
  private func trailingAnchorToTrailingAnchorConstraint(firstItem: NSControl) {
    
    firstItem.trailingAnchor.constraint(equalTo: labelSubTotalAmount.trailingAnchor, constant: 0).isActive = true
    
  }
  
  fileprivate func setConstraintsForControls() {
    
    //    MARK: labelSubTotal Constraints
    
    topAnchorToTopAnchorConstraint(firstItem: labelSubTotal, secondItem: labelSubTotalAmount)
    
    labelSubTotal.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
    
    leadingAnchorToLeadingAnchorConstraint(item: labelSubTotal)
    
    bottomAnchorToTopAnchorConstraint(firstItem: labelSubTotal, secondItem: labelTotalAfterTax, withConstant: 10.0)
    
    //    MARK: labelTotalAfterTax Constraints
    
    topAnchorToTopAnchorConstraint(firstItem: labelTotalAfterTax, secondItem: labelTotalAfterTaxAmount)
    
    leadingAnchorToLeadingAnchorConstraint(item: labelTotalAfterTax)
    
    bottomAnchorToTopAnchorConstraint(firstItem: labelTotalAfterTax, secondItem: labelTipSlider, withConstant: 15.0)
    
    //    MARK: labelTipSlider Constraints
    
    topAnchorToTopAnchorConstraint(firstItem: labelTipSlider, secondItem: sliderTipPercentage)
    
    leadingAnchorToLeadingAnchorConstraint(item: labelTipSlider)
    
    bottomAnchorToTopAnchorConstraint(firstItem: labelTipSlider, secondItem: labelTip, withConstant: 20.0)
    
    //    MARK: labelTip Constraints
    
    topAnchorToTopAnchorConstraint(firstItem: labelTip, secondItem: labelTipAmount)
    
    leadingAnchorToLeadingAnchorConstraint(item: labelTip)
    
    bottomAnchorToTopAnchorConstraint(firstItem: labelTip, secondItem: labelTotalAfterTip, withConstant: 5.0)
    
    //    MARK: labelTotalAfterTip Constraints
    
    topAnchorToTopAnchorConstraint(firstItem: labelTotalAfterTip, secondItem: labelTotalAfterTipAmount)
    
    leadingAnchorToLeadingAnchorConstraint(item: labelTotalAfterTip)
    
    //    MARK: labelSubTotalAmount Constraint
    
    labelSubTotalAmount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
    
    //    MARK: labelTotalAfterTaxAmount Constraint
    
    trailingAnchorToTrailingAnchorConstraint(firstItem: labelTotalAfterTaxAmount)
    
    //    MARK: sliderTipPercentage Constraints
    
    sliderTipPercentage.widthAnchor.constraint(equalToConstant: 162.0).isActive = true
    
    trailingAnchorToTrailingAnchorConstraint(firstItem: sliderTipPercentage)
    
    bottomAnchorToTopAnchorConstraint(firstItem: sliderTipPercentage, secondItem: labelTipPercentage, withConstant: 0)
    
    //    MARK: labelTipPercentage Constraints
    
    trailingAnchorToTrailingAnchorConstraint(firstItem: labelTipPercentage)
    
    bottomAnchorToTopAnchorConstraint(firstItem: labelTipPercentage, secondItem: labelTipAmount, withConstant: 10.0)
    
    //    MARK: labelTipAmount Constraint
    
    trailingAnchorToTrailingAnchorConstraint(firstItem: labelTipAmount)
    
    //    MARK: labelTotalAfterTipAmount Constraints
    
    trailingAnchorToTrailingAnchorConstraint(firstItem: labelTotalAfterTipAmount)
    
    bottomAnchorToTopAnchorConstraint(firstItem: labelTotalAfterTipAmount, secondItem: buttonCalculateTip, withConstant: 20.0)
    
    //    MARK: buttonCalculateTip Constraints
    
    buttonCalculateTip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
    
    buttonCalculateTip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
    
    buttonCalculateTip.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
  }
}
