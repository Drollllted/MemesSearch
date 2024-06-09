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
    private let isResult: Bool = false
    private let isTappedLike: Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        memesView = MemesView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = memesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        memesView.searchButton.addTarget(self, action: #selector(getImage), for: .touchUpInside)
    }
    
    //MARK: - UI Methods (Objc and func)
    @objc func getImage() {
        fetchImage()
    }
    
    
    
    private func fetchImage() {
        apiRequest.getMemes { [weak self] urlImage in
            
            guard let self = self else {return}
            let imageMemes = self.memesView.memesImage
            
            DispatchQueue.global().async {
                if let urlImage = urlImage {
                    DispatchQueue.main.async{
                        
                        if self.isResult{
                            guard let url = URL(string: urlImage) else {return}
                            guard let data = try? Data(contentsOf: url), let imageURL = UIImage(data: data)  else {return}
                            imageMemes.image = imageURL
                        }
                    }
                }
            }
        }
        
    }
    
    
}

