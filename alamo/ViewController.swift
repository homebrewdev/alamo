//
//  ViewController.swift
//  alamo
//
//  Created by Egor Devyatov on 10/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    struct Product: Codable {
        let userId: Int
        let id: Int
        let title: String?
        let body: String?
    }
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        request("http://jsonplaceholder.typicode.com/posts").responseJSON { response in
//            print(response)
        }

    @IBAction func alamoBtnTap(_ sender: UIButton) {
        request("http://jsonplaceholder.typicode.com/posts").responseJSON { response in
            let json = String(bytes: response.data!, encoding: .utf8)
            self.textView.text = json
            
            let decoder = JSONDecoder().decode(Product.self, from: response.data!)
            //let product = decoder.decode(Product.self, from: response.data!)
            
            print("body = \(String(describing: decoder.body))")
        }
    }
}
