//
//  ViewController.swift
//  IntroductStudent
//
//  Created by Tycho Collins on 8/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Attach the stepper's value change event to the stepperDidChange method
        morePetsStepper.addTarget(self, action: #selector(stepperDidChange(_:)), for: .valueChanged)
    }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        // Update the numberOfPetsLabel with the current value of the stepper
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
        
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        // Safely unwrap the values from the text fields and segmented control
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let schoolName = schoolNameTextField.text, !schoolName.isEmpty,
              let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex),
              let numberOfPets = numberOfPetsLabel.text else {
            // Handle the case where any required value is nil or empty
            return
        }
        
        // Creating a variable of type string, that holds an introduction.
        // The introduction interpolates the values from the text fields provided.
        let introduction = """
        My name is \(firstName) \(lastName) and I attend \(schoolName).
        I am currently in my \(year) year and I own \(numberOfPets) dogs.
        It is \(morePetsSwitch.isOn ? "true" : "false") that I want more pets.
        """
        
        // Creates the alert where we pass in our message, which is our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        // Presenting the alert controller
        present(alertController, animated: true, completion: nil)
    }
}
