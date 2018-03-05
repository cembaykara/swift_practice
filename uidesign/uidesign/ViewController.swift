//
//  ViewController.swift
//  uidesign
//
//  Created by Baris Cem Baykara on 2/20/18.
//  Copyright © 2018 Baris Cem Baykara. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let newView = Card.newAutoLayout()
    let layout = UICollectionViewFlowLayout()
    var containerView: UICollectionView!
    var header: String = "Siidisaba 7"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal

        containerView.autoSetDimension(.height, toSize: newView.height + 32)
        containerView.collectionViewLayout = layout
        containerView.register(Card.self, forCellWithReuseIdentifier: "card")
        containerView.backgroundColor = .clear
        containerView.dataSource = self
        containerView.delegate = self
        
        view.addSubview(containerView)
    }
    
    var constraintsUpdated = false
    
    override func updateViewConstraints() {
        if !constraintsUpdated {
            containerView.autoPinEdgesToSuperviewEdges(with: view.safeAreaInsets, excludingEdge: .top)
        }
        constraintsUpdated = true
        
        super.updateViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = containerView.contentOffset
        visibleRect.size = containerView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath: IndexPath? = containerView.indexPathForItem(at: visiblePoint)
        
        guard let indexPath = visibleIndexPath else { return }
        //containerView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        collectionView(containerView, didSelectItemAt: indexPath)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var insets = self.containerView.contentInset
        let value:CGFloat = 32.0
        insets.left = value
        insets.right = value
        self.containerView.contentInset = insets
        self.containerView.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! Card
        cell.header.text = header
        cell.distance.text = "858.07m"
        cell.icon.image = #imageLiteral(resourceName: "Image")
        return cell
    }
    
    let colors = [UIColor.red,UIColor.purple,UIColor.orange]
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        containerView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        view.backgroundColor = colors[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-64, height: newView.height)
    }
}

