//
//  ViewController.swift
//  URLSession
//
//  Created by 1 on 3/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    var imageWidth = ""
    var imageHeight = ""

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func getImage(_ sender: Any) {
        // 1) Get API
        let API = "https://picsum.photos/" + imageWidth + "/" + imageHeight
        // 2) create URL
        guard let apiURL = URL(string: API) else {
            fatalError("some Error")
        }
        // 3) Initiolize session
        let session = URLSession(configuration: .default)
        // 4) create an inquiry dataTask
        let task = session.dataTask(with: apiURL){ (data, response, error) in
            // 5) process gotten data
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                // data = .jpeg
                self.imageView.image = UIImage(data: data)
            }
        }
        // Запустить запрос
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let height = imageView.bounds.height
        self.imageHeight = String(format: "%.0f", Double(height))
        
        let width = imageView.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))
    }
}

