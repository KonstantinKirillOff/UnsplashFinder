//
//  ViewController.swift
//  UnsplashFinder
//
//  Created by Konstantin Kirillov on 03.09.2022.
//

import UIKit

class WordCardViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var engWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButtonPressed() {
        NetworkManager.shared.fetchURLUnslashImage(for: engWordTextField.text ?? "") { urlString in
            guard let url = URL(string: urlString) else { return }
            guard let imageData = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(systemName: "pc")
                }
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
    
}

