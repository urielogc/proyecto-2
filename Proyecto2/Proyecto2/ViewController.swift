//
//  ViewController.swift
//  Proyecto2
//
//  Created by:
//  - Gutierrez Cortes Uriel Omar
//  - Macias Hernandez Daniel
//  on 02/12/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productDetailImage: UIImageView!
    @IBOutlet weak var productDetailName: UILabel!
    
    var productsInfo:[ProductInfo] = [
        ProductInfo(imageName: "item1", name: "Taladro"),
        ProductInfo(imageName: "item2", name: "Pico"),
        ProductInfo(imageName: "item3", name: "Computador"),
        ProductInfo(imageName: "item4", name: "grabadora"),
        ProductInfo(imageName: "item5", name: "pesas")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setProductDetailInfo(productImageName:String, productName:String) {
        
        productDetailImage.image = UIImage(named: productImageName)
        productDetailName.text = productName
        
    }
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let product = productsInfo[indexPath.row]
        
        cell.productImageCell.image = UIImage(named: product.productImageName)
        cell.productNameCell.text = product.productName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsInfo[indexPath.row]
        self.setProductDetailInfo(productImageName: product.productImageName, productName: product.productName)
    }
}
