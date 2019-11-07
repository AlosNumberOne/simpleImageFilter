//
//  LinearAdjustmentViewController.swift
//  adjustBSC
//
//  Created by Appnap WS01 on 10/10/19.
//  Copyright © 2019 Appnap WS01. All rights reserved.
//

import UIKit

class LinearAdjustmentViewController: UIViewController {
    
    var filter: LinearAdjustableFilter?
    
//    @IBOutlet var label: UILabel!
//    @IBOutlet var slider: UISlider!
//    @IBOutlet var previewImage: UIImageView!
//
//    @IBAction func sliderChanged(_ sender: AnyObject) {
//        filter?.value = Double(slider.value)
//        applyFilterAndUpdatePreview()
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "FiltersUpdated"), object: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = filter?.name
        slider.minimumValue = Float((filter?.min)!)
        slider.maximumValue = Float((filter?.max)!)
        slider.value = Float((filter?.value)!)
        applyFilterAndUpdatePreview()
    }
    
    func applyFilterAndUpdatePreview() {
        let originalImage = Image( image: UIImage(named: "baby.jpj")! )
        let filteredImage = filter!.apply(input: originalImage)
        previewImage.image = filteredImage.toUIImage()
    }
}
