//
//  Double.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 02/03/24.
//

import Foundation

extension Double {
    
    /// Convert Double into Currency with 2-6 decimal places
    /// ```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter2 :  NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "inr"
        formatter.currencySymbol = "\u{20B9}"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter;
    }
    /// Convert Double into Currency as a String with 2-6 decimal places
    /// ```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith2decimals()->String{
        let number = NSDecimalNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    /// Convert Double into Currency with 2-6 decimal places
    /// ```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter6 :  NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "inr"
        formatter.currencySymbol = "\u{20B9}"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter;
    }
    /// Convert Double into Currency as a String with 2-6 decimal places
    /// ```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6decimals()->String{
        let number = NSDecimalNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Convert Double into String representation
    /// ```
    ///Convert 12.3456 to "12.34"
    ///Convert 0.123456 to "$0.123456"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    func asPercentString() ->String {
        return asNumberString()+"%"
    }
    
}
