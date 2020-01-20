//
//  HSJSONError.swift
//  Redux
//
//  Created by Erik Tollefsrud on 1/13/20.
//  Copyright © 2020 Erik Tollefsrud. All rights reserved.
//

import Foundation

enum HSJSONError: String, Error {
    case invalidUrl = "Could not create URL from url string."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again."
}
