//
//  MainViewController.swift
//  spotify-style-login
//
//  Created by Sungwoong Kang on 2021/12/15.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController{
    @IBOutlet weak var welcomeLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false // pop gesture를 막음
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLabel.text = """
            환영합니다.
            \(email)님
        """
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true) // 버튼을 누르면 첫번째 화면으로 넘어감
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
        
    }
}
