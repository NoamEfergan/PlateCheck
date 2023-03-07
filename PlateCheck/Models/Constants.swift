//
//  Constants.swift
//  PlateCheck
//
//  Created by Noam Efergan on 07/03/2023.
//

import UIKit

enum AppColours {
    static let background: UIColor? = .init(hexString: "#F9E29A")
    static let mainColor: UIColor? = .init(hexString: "#363635")
    static let secondaryColor: UIColor? = .init(hexString: "#626163")
}

enum Networking {
    #if DEBUG
    static let baseURL = "https://uat.driver-vehicle-licensing.api.gov.uk/vehicle-enquiry/v1/"
    #else
    static let baseURL = "https://driver-vehicle-licensing.api.gov.uk/vehicle-enquiry/v1/"
    #endif
    
    enum Paths: String {
        case vehicles
    }
}
