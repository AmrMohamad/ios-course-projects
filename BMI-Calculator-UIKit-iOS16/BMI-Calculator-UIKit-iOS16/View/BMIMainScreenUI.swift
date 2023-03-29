//
//  BMIMainScreenUI.swift
//  BMI-Calculator-UIKit-iOS16
//
//  Created by Amr Mohamad on 29/03/2023.
//

import Foundation
import UIKit

class BMIMainScreenUI {
    let background:UIImageView = {
        let image = UIImageView(image: UIImage(named: "calculate_background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
}
