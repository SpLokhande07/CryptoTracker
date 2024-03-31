//
//  UIApplication.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 31/03/24.
//

import Foundation
import SwiftUI

extension UIApplication{
    func endEdting(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
