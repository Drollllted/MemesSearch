//
//  ViewController.swift
//  MemesSearch
//
//  Created by Drolllted on 03.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var memesView: MemesView!
    private let apiRequest = APIRequest.shared
   // private var fetchImageMemes = FetchImage.shared
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
        memesView.likeButton.addTarget(self, action: #selector(tappedLike), for: .touchUpInside)
        memesView.dislikeButton.addTarget(self, action: #selector(tappedDislike), for: .touchUpInside)
    }
    
    //MARK: - UI Methods (Objc and func)
    @objc func getImage() {
        guard let text = memesView.questionTextField.text else {return}
        if !text.isEmpty{
            memesView.searchButton.isHidden = true
            fetchImage(isResult: true)
            memesView.questionTextField.resignFirstResponder()
        }else{
            let alertController = UIAlertController(title: "Ошибка", message: "Добавьте текст для предсказания", preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(alertButton)
            present(alertController, animated: true)
        }
    }
    
    @objc func tappedLike() {
        let alertController = UIAlertController(title: "Отлично", message: "Мы рады что подобрали мем!", preferredStyle: .actionSheet)
        let alertButton = UIAlertAction(title: "Новый Запрос?", style: .default) { _ in
            self.memesView.questionTextField.text = ""
            self.memesView.memesImage.image = nil
            self.memesView.searchButton.isHidden = false
        }
        alertController.addAction(alertButton)
        present(alertController, animated: true)
        
    }
    
    @objc func tappedDislike() {
        fetchImage(isResult: true)
    }
    
    //MARK: - Functions
    
    
    func fetchImage(isResult: Bool) {
        apiRequest.getMemes { [weak self] urlImage in
            guard let self = self else { return }
            if let urlImageFull = urlImage, isResult == true {
                print(urlImageFull)
                if let url = URL(string: urlImageFull) {
                    // Используем URLSession для асинхронной загрузки данных
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        guard let data = data, error == nil else {
                            print("Failed to load image data: \(error?.localizedDescription ?? "Unknown error")")
                            return
                        }
                        
                        DispatchQueue.main.async {
                            if let image = UIImage(data: data) {
                                self.memesView.memesImage.image = image
                            } else {
                                print("Failed to create UIImage from data")
                            }
                        }
                    }.resume()
                }
            }
        }
    }

    
    
    
    
    
    
}
