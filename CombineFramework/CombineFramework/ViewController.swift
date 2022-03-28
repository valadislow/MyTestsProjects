//
//  ViewController.swift
//  CombineFramework
//
//  Created by 1 on 3/27/22.
//

import UIKit
import Combine

struct BlogPost {
    let title: String
    let url: URL
}

extension Notification.Name {
    static let newBlogPost = Notification.Name("Newblogpost")
}

class ViewController: UIViewController {

    @IBOutlet weak var acceptTermSwitch: UISwitch!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var makePostButton: UIButton!
    
    @Published var canMakePost: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        $canMakePost.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: makePostButton)
    }
     
    private func setUpCombine(){
        let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
        let postLabelSubcriber = Subscribers.Assign(object: postLabel, keyPath: \.text)
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        canMakePost = sender.isOn
    }
    @IBAction func makePostTapped(_ sender: Any) {
    }
    
}

