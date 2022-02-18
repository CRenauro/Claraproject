//
//  AddNewUserViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/4/22.
//

import UIKit

protocol AddUserProtocolDelegate: AnyObject {
    func CancelAddingUser(_ controller:
    AddNewUserViewController)
    
    func AddNewUser(_ controller: AddNewUserViewController, user: User)
        
    }

class AddNewUserViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    weak var addUserDelegate: AddUserProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
        // Do any additional setup after loading the view.
    }
   
    @IBAction func cancelAddUser(_ sender: Any) {
        addUserDelegate?.CancelAddingUser(self)
    }
    @IBAction func saveUser(_ sender: Any) {
        let user = User(image: "https://www.planetware.com/photos-large/N/norway-attractions-sognefjord.jpg", first: firstName.text!, last: lastName.text!, myEmail: email.text!)
        addUserDelegate?.AddNewUser(self, user: user)
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
