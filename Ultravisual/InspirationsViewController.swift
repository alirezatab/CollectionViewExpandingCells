//
//  InspirationsViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class InspirationsViewController: UICollectionViewController {
  
  let inspirations = Inspiration.allInspirations()
  let colors = UIColor.palette()
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if #available(iOS 10.0, *) {
        collectionView!.isPrefetchingEnabled = false
    }
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView!.backgroundColor = UIColor.clear
    
    //let layout = collectionViewLayout as! UICollectionViewFlowLayout
    //layout.itemSize = CGSize(width: collectionView!.bounds.width, height: 100)
  }

}

extension InspirationsViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return inspirations.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InspirationCell", for: indexPath) as! InspirationCell
    cell.inspiration = inspirations[indexPath.item]
    return cell
  }

}
