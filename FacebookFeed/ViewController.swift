//
//  ViewController.swift
//  FacebookFeed
//
//  Created by Prashant Humney on 27/02/21.
//  Copyright © 2021 Prashant Humney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }

  private func setupCollectionView() {
    collectionView.backgroundColor = UIColor.red
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
      view.topAnchor.constraint(equalTo: collectionView.topAnchor),
      view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
    ])
  }
}

