//
//  DataResponse.swift
//  SchoolList
//
//  Created by Ahn on 2020/05/24.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import ObjectMapper

struct SecondResponse {
    var schoolName: String!
    var studentCount: Int!
}

extension SecondResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        schoolName <- map["schoolName"]
        studentCount <- map["studentCount"]
    }
}

struct FirstResponse {
    var result: [SecondResponse]!
    var code: Int!
    var message: String!
}

extension FirstResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        message <- map["message"]
    }
}
