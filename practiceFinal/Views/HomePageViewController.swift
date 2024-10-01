//
//  HomePageViewController.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import UIKit
import Alamofire

var CATEGORY: [Category] = []

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        AF.request("file").responseDecodable(of: CategoryList.self) { data in
            switch data.result {
            case .success(let success):
                CATEGORY = success.categories
            case .failure(let error):
                print(error)
            }
        }
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



