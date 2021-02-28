//
//  ViewController.swift
//  FacebookFeed
//
//  Created by Prashant Humney on 27/02/21.
//  Copyright © 2021 Prashant Humney. All rights reserved.
//

import UIKit

class FeedController: UIViewController {

  let cellIdentifier = "cellIdentifier"
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Facebook Feed"
    setupCollectionView()
  }

  private func setupCollectionView() {
    collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.alwaysBounceVertical = true
    view.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
      view.topAnchor.constraint(equalTo: collectionView.topAnchor),
      view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
    ])
    
    collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
}

extension FeedController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
    cell.title.text = "Iron Man"
    cell.subtitle.text = "December 18 ! San Francisco !"
    return cell
  }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
}

class CustomCollectionViewCell: UICollectionViewCell {

  let title: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.black
    label.font = UIFont.boldSystemFont(ofSize: 14.0)
    return label
  }()
  
  let subtitle: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.black
    label.font = UIFont.boldSystemFont(ofSize: 12.0)
    label.textColor = UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)
    return label
  }()
  
  let profileImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "marvel")
    view.contentMode = .scaleAspectFit
    return view
  }()
  
  let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "globe")
    view.contentMode = .scaleAspectFit
    return view
  }()
  
  let textView: UITextView = {
    let view = UITextView()
    view.textColor = UIColor.black
    view.text = "Sometimes you gotta run before you can walk."
    view.font = UIFont.systemFont(ofSize: 14.0)
    return view
  }()
  
  let statusImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "avengers")
    view.contentMode = .scaleAspectFill
    view.layer.masksToBounds = true
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    backgroundColor = UIColor.white
    addSubview(title)
    addSubview(profileImageView)
    addSubview(subtitle)
    addSubview(imageView)
    addSubview(textView)
    addSubview(statusImageView)
    title.translatesAutoresizingMaskIntoConstraints = false
    subtitle.translatesAutoresizingMaskIntoConstraints = false
    profileImageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    statusImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
      profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
      profileImageView.widthAnchor.constraint(equalToConstant: 44.0),
      profileImageView.heightAnchor.constraint(equalToConstant: 44.0)
    ])
    
    NSLayoutConstraint.activate([
      title.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8.0),
      self.trailingAnchor.constraint(equalTo: title.trailingAnchor),
      title.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0)
    ])
    
    NSLayoutConstraint.activate([
      subtitle.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8.0),
      subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4.0)
    ])
    
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: subtitle.trailingAnchor, constant: 4.0),
      imageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4.0),
      imageView.widthAnchor.constraint(equalToConstant: 15.0),
      imageView.heightAnchor.constraint(equalToConstant: 15.0)
    ])
    
    NSLayoutConstraint.activate([
      textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
      textView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4.0),
      textView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      textView.heightAnchor.constraint(equalToConstant: 30.0)
    ])
    
    NSLayoutConstraint.activate([
      statusImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      statusImageView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 4.0),
      statusImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      statusImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
