//
//  ViewController.swift
//  MemesSearch
//
//  Created by Drolllted on 03.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var apiRequest = APIRequest.shared
    private var memesView: MemesView!
    
    override func loadView() {
        memesView = MemesView()
        view = memesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        apiRequest.getMemes()
    }


}

