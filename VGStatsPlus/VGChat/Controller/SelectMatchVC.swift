//
//  SelectMatchVC.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 12/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class SelectMatchVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var indexNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

       collectionView.delegate = self
       collectionView.dataSource = self
       
    }

   
    @IBAction func nextBtnTapped(_ sender: Any) {
        indexNum += 1
        collectionView.reloadData()
    }
    
    @IBAction func cancellBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension SelectMatchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectMatchCell", for: indexPath) as? SelectMatchCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(match: VGDataSource.instance.matches[indexNum])
        return cell
    }
}

