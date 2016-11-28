//
//  TodoListViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    

}


extension TodoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /// Casts the cell into the specific TodoCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todoCell", for: indexPath) as! TodoCollectionViewCell
        
        
        
        // Curve the edges.
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 3
    }
    
}
