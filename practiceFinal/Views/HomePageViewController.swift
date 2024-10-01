//
//  HomePageViewController.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import UIKit
import Alamofire

var CATEGORY: [Category] = []
var MENU: [Menu] = []

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCategory()
        fetchMenu()
    }
    
    private func fetchCategory() {
        AF.request("https://raw.githubusercontent.com/SaaiLeo/practiceFinal/refs/heads/main/practiceFinal/Models/Categories.json").responseDecodable(of: CategoryList.self) { data in
            switch data.result {
            case .success(let success):
                CATEGORY = success.categories
                self.updateUI()
            case .failure(let error):
                print("fetching category error:",error)
            }
        }
    }
    
    private func fetchMenu() {
        AF.request("").responseDecodable(of: MenuList.self) { data in
            switch data.result {
            case .success(let menulist):
                MENU = menulist.menus
            case .failure(let error):
                print("fetching Menu error:", error)
            }
        }
    }
    
    private func updateUI() {
        categoryCollectionView.reloadData()
    }
    

    
    func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }

}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CATEGORY.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.setup(CATEGORY[indexPath.row])
        
        return cell
    }
}



