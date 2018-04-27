//
//  Protocol.swift
//  uidesign
//
//  Created by Baris Cem Baykara on 3/2/18.
//  Copyright © 2018 Baris Cem Baykara. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    struct customBackground {
        static let backgroundWhite = UIColor(displayP3Red: 254/255, green: 254/255, blue: 254/255, alpha: 1.0) //FEFEFE
    }
    
    struct customGray{
        static let darkGray = UIColor(displayP3Red: 41/255, green: 43/255, blue: 57/255, alpha: 1.0) //292B39
        static let lightGray = UIColor(displayP3Red: 190/255, green: 196/255, blue: 210/255, alpha: 1.0) //BEC4D2
    }
    
    struct gradientOrange{
        static let firstColor = UIColor(displayP3Red: 255/255, green: 203/255, blue: 0/255, alpha: 1.0) //FFCB00
        static let secondColor = UIColor(displayP3Red: 255/255, green: 73/255, blue: 0/255, alpha: 1.0) //FF4900
    }
    
    struct gradientBlue{
        static let firstColor = UIColor(displayP3Red: 121/255, green: 199/255, blue: 255/255, alpha: 1.0) //79C7FF
        static let secondColor = UIColor(displayP3Red: 36/255, green: 66/255, blue: 170/255, alpha: 1.0) //2442AA
    }
    
}
