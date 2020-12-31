//
//  ProfileViewController.swift
//  Bookquipo
//
//  Created by Nency Shobhashana on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var profileDob: UITextField!
    @IBOutlet weak var profileAddress: UITextView!
    @IBOutlet weak var profileGender: UITextField!
    
    var userProfile: UserProfile? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // set image and text from userProfile
    override func viewWillAppear(_ animated: Bool) {
        userProfile = UserDefaultManager.shared.userProfile
        
        profileImage.image = UIImage(named: userProfile?.image ?? "")
        profileName.text = userProfile?.name
        profileDob.text = userProfile?.dob
        profileAddress.text = userProfile?.address
        profileGender.text = userProfile?.gender
    }
    
    // move to login page and perform logout procedure 
    @IBAction func logoutClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "logout", sender: self)
    }
        
}

