//
//  Filters.swift
//  adjustBSC
//
//  Created by Appnap WS01 on 10/10/19.
//  Copyright © 2019 Appnap WS01. All rights reserved.
//

import Foundation
import UIKit
let allFilters: [Filter] = [
    //MirrorFilter(),
    //MirrorTopBottomFilter(),
    //ScaleIntensityFilter(),
    MixFilter(),
    //HueFilter(),
    //SaturationFilter(),
    BrightnessFilter(),
    //GreyScaleFilter(),
    InvertFilter(),
    //Colors8Filter(),
    //Dither8Filter(),
    //Colors16Filter(),
   // Dither16Filter(),
]
class ScaleIntensityFilter : Filter{
    let name: String = "Scale Intensity "
    let scale : Double
    init(scale: Double) {
        self.scale = scale
    }
    func apply(input: Image) -> Image {
        return input.transformPixels({(p1: RGBAPixel) -> RGBAPixel in
        var p = p1
            p.red = UInt8( Double ( p.red ) * self.scale )
            p.green = UInt8( Double ( p.green ) * self.scale )
            p.blue = UInt8( Double ( p.blue ) * self.scale )
            return p
       })
        
    }
}
class MixFilter : Filter {
    let name: String = "Mix Filter"
//    let scale : Double
//    init(scale: Double) {
//        self.scale = scale
//    }
    func apply( input: Image) -> Image {
        return input.transformPixels({ (p1:RGBAPixel) -> RGBAPixel in
            var p = p1
            let r = p.red
            p.red = p.blue
            p.blue = p.green
            p.green = r
            return p
        })
    }
}
class GrayScaleFilter : Filter {
    let name: String = " Gray Scale Filter"
    func apply(input: Image) -> Image {
        return input.transformPixels({(p: RGBAPixel ) -> RGBAPixel in
            let i = p.averageIntensity
            return RGBAPixel(r:i, g:i , b:i)
        })
    }
}
class InvertFilter : Filter {
    let name: String = "Invert Filter"
    func apply(input: Image) -> Image {
        return input.transformPixels({ (p:RGBAPixel) -> RGBAPixel in
            
            return RGBAPixel(r:(0xFF-p.red),g:(0xFF-p.green),b:(0xFF-p.blue))
        })
    }
}


class BrightnessFilter : Filter, LinearAdjustableFilter {
    let name: String = "Brightness"
    var value: Double
    let min: Double = 0.0
    let max: Double = 4.0
    let defaultValue: Double = 1.5
    init() {
        self.value  = self.defaultValue
    }
    func apply(input: Image) -> Image {
        return input.transformPixels({ (p:RGBAPixel) -> RGBAPixel in
            
            let uiColor =  p.toUIColor()
            var hls = HLSPixel()
            
            uiColor.getHue(&hls.h, saturation: &hls.s, brightness: &hls.l, alpha: &hls.a)
            let newUiColor = UIColor(hue: hls.h, saturation: hls.s, brightness: CGFloat(hls.l) * CGFloat(self.value), alpha: hls.a)
            
            return RGBAPixel(uiColor: newUiColor)
        })
    }
}
