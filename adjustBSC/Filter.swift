//
//  Filter.swift
//  adjustBSC
//
//  Created by Appnap WS01 on 10/10/19.
//  Copyright © 2019 Appnap WS01. All rights reserved.
//

import Foundation
protocol Filter {
    var name: String {get}
    
    func apply( input : Image ) -> Image
}
protocol LinearAdjustableFilter: Filter {
    var value : Double {get set}
    var min : Double  {get}
    var max: Double {get}
    var defaultValue: Double {get}
}
