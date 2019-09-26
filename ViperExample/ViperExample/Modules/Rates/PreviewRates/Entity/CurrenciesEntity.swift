//
//  CurrenciesEntity.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation

class CurrencyInfoModel: Codable {
    let code: String?
    let userMessage: JSONNull?
    let messageType: Int?
    let currencyJSONData: [JSONDatum]?
    let jsonArray: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case userMessage = "UserMessage"
        case messageType = "MessageType"
        case currencyJSONData = "JsonData"
        case jsonArray = "JsonArray"
    }
    
    init(code: String?, userMessage: JSONNull?, messageType: Int?, currencyJSONData: [JSONDatum]?, jsonArray: JSONNull?) {
        self.code = code
        self.userMessage = userMessage
        self.messageType = messageType
        self.currencyJSONData = currencyJSONData
        self.jsonArray = jsonArray
    }
}

// MARK: - JSONDatum
class JSONDatum: Codable {
    let code, fullName, name, displayName: String?
    let fxRate: String?
    let fxRateCurr: FxRateCurr?
    let fxSellRate: String?
    let fxSellRateCurr: FxRateCurr?
    let fxStatus: String?
    let date: String?
    let serviceIntervalTime: JSONNull?
    let fxRateStatusWarning: String?
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case fullName = "FullName"
        case name = "Name"
        case displayName = "DisplayName"
        case fxRate = "FxRate"
        case fxRateCurr = "FxRateCurr"
        case fxSellRate = "FxSellRate"
        case fxSellRateCurr = "FxSellRateCurr"
        case fxStatus = "FxStatus"
        case date = "Date"
        case serviceIntervalTime = "ServiceIntervalTime"
        case fxRateStatusWarning = "FxRateStatusWarning"
    }
    
    init(code: String?, fullName: String?, name: String?, displayName: String?, fxRate: String?, fxRateCurr: FxRateCurr?, fxSellRate: String?, fxSellRateCurr: FxRateCurr?, fxStatus: String?, date: String?, serviceIntervalTime: JSONNull?, fxRateStatusWarning: String?) {
        self.code = code
        self.fullName = fullName
        self.name = name
        self.displayName = displayName
        self.fxRate = fxRate
        self.fxRateCurr = fxRateCurr
        self.fxSellRate = fxSellRate
        self.fxSellRateCurr = fxSellRateCurr
        self.fxStatus = fxStatus
        self.date = date
        self.serviceIntervalTime = serviceIntervalTime
        self.fxRateStatusWarning = fxRateStatusWarning
    }
}

//enum DateEnum: String, Codable {
//    case the19092019144626 = "19.09.2019 14:46:26"
//}

enum FxRateCurr: String, Codable {
    case tl = "TL"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

