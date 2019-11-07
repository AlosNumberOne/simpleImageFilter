//
//  ViewController.swift
//  adjustBSC
//
//  Created by Appnap WS01 on 10/10/19.
//  Copyright © 2019 Appnap WS01. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
  
    @IBOutlet weak var label: UILabel!

  
    
    @IBOutlet weak var uislider: UISlider!
    
    
   
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedFilter : FiltersModel = FiltersModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        //let image = Image(image: UIImage(named: "baby.jpj")!)
        //let i2 = image.transformPixels(halfIntens)
        //selectedFilter.filters.append(InvertFilter())
//        selectedFilter.filters.append ( MixFilter() )
//        selectedFilter.filters.append(ScaleIntensityFilter(scale: 0.5))
//        let f1 = MixFilter()
//        let f2 = ScaleIntensityFilter(scale: 0.5)
        
//        let image2 = f1.apply(input: image)
//        let image3 = f2.apply(input: image2)
        imageView.image = filterImage().toUIImage()
       // imageView.image = image3.toUIImage()
        // Do any additional setup after loading the view.
    }
    
    func filterImage () -> Image{
        var image = Image (image: UIImage(named: "baby.jpj")!)
        for filter in selectedFilter.filters{
            image = filter.apply(input: image)
        }
        return image
    }
//    func halfIntens(p: RGBAPixel)->RGBAPixel{
//        var p2 = p
//        p2.red = p2.red/2
//        p2.blue = p2.blue / 2
//        p2.green = p2.green/2
//        return p2
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectFilterViewController = segue.destination as? selectFilterViewController{
            selectFilterViewController.filterModel = selectedFilter
        }
        
    }


    @IBAction func grayImage(_ sender: UIButton) {
        selectedFilter.filters.append(GrayScaleFilter())
        imageView.image = filterImage().toUIImage()
        
    }
    
    @IBAction func invert(_ sender: UIButton) {
        selectedFilter.filters.append(InvertFilter())
        imageView.image = filterImage().toUIImage()
    }
}


