//
//  DVLAResponse.swift
//  PlateCheck
//
//  Created by Noam Efergan on 07/03/2023.
//

import Foundation

struct DVLAResponse: Codable {
    let registrationNumber, artEndDate: String?
    let co2Emissions, engineCapacity: Int?
    let euroStatus: String?
    let markedForExport: Bool?
    let fuelType, motStatus: String?
    let revenueWeight: Int?
    let colour, make, typeApproval: String?
    let yearOfManufacture: Int?
    let taxDueDate, taxStatus, dateOfLastV5CIssued, wheelplan: String?
    let monthOfFirstDvlaRegistration, monthOfFirstRegistration, realDrivingEmissions: String?
}
