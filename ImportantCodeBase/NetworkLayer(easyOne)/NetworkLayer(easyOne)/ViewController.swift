//
//  ViewController.swift
//  NetworkLayer(easyOne)
//
//  Created by MDREZAUL KARIM on 8/28/20.
//  Copyright © 2020 storage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ServiceLayer.request(router: .getSources) { (result: Result<[String: [CollectionInfo]], Error>) in
            switch result {
            case .success:
                print(result)
            case .failure:
                print(result)
            }
        }
    }


}

