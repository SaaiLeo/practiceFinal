//
//  MenuViewController.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: MenuCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MENU.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
        
        cell.setup(MENU[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let scene = storyboard?.instantiateViewController(withIdentifier: MenuDetailViewController.identifier) as! MenuDetailViewController
        
        scene.menu = MENU[indexPath.row]
        
        scene.modalTransitionStyle = .crossDissolve
        present(scene, animated: true, completion: nil)
    }
    
    
    
    
}
