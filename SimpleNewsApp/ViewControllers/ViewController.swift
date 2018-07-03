//
//  ViewController.swift
//  SimpleNewsApp
//
//  Created by Vijesh on 03/07/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let newsCellId = "newsCellId"
    
    var newsItems: [NewsModel]?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 248, green: 248, blue: 248)
        self.navigationItem.title = "NY Times Most Popular Articles"
        
        
        
        self.view.addSubview(collectionView)
        if #available(iOS 11.0, *) {
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        } else {
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        }
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        collectionView.register(NewsItemCell.self, forCellWithReuseIdentifier: newsCellId)
        
        loadJsonFromApi()
    }
    
    
    private func loadJsonFromApi() {
        
        let urlString =  "\(OurHelper.baseUrl)\(7).json?api-key=\(OurHelper.apiKey)"
       
        let activityView = MyActivityView()
        activityView.displayLoader()
        ApiService.sharedManager.startApiService(urlString, success: { (data) in
            
            activityView.dismissLoader()
           
            //Implement JSON decoding and parsing
            do {
                
                //Decode retrived data with JSONDecoder
                let resultRoot = try JSONDecoder().decode(ResultRoot.self, from: data)
                
                guard let resultItems = resultRoot.results else {
                    self.showErrorAlert(title: "Error", messgage: "Some error occured. Please try again later")
                    return
                }
                
                self.newsItems = resultItems
                self.collectionView.reloadData()
                
                
            } catch let jsonError {
                print(jsonError)
                self.showErrorAlert(title: "Error", messgage: "Some error occured. Please try again later")
            }
            
            
        }) { (errorString) in
            activityView.dismissLoader()
            print("error string")
        }
    }
    
    
    func showErrorAlert(title: String?, messgage: String?) {
        let alertController = UIAlertController(title: title, message: messgage, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsCellId, for: indexPath) as! NewsItemCell
        cell.newsModel = self.newsItems?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = NewsDetailViewController()
        controller.newsModel = self.newsItems?[indexPath.item]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

