//
//  DataStruct.swift
//  project1
//
//  Created by Phamcuong on 04/11/2022.
//

import Foundation

struct ReqNotify: Codable {
    var code: Int
    var message: String?
    var messageCode: String?
    var data: tokenData?
    
    public enum CodingKeys: String, CodingKey {
        case code = "code"
        case message
        case messageCode
        case data
    }
}

struct tokenData: Codable {
    var accessToken: String?
    var accessTokenExpiredTime: Int
}

struct User: Codable {
    var code: Int
    var message: String?
    var messageCode: String?
    var data: profileData?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message
        case messageCode
        case data
    }
}

struct profileData: Codable {
    var imageUrl: String?
    var email: String?
    var name: String?
    var phone: String?
    var shiftId: Int
    var workspaceId: Int
    
    init(imageUrl: String, email: String, name: String, phone: String, shiftId: Int, workspaceId: Int) {
        self.imageUrl = imageUrl
        self.email = email
        self.name = name
        self.phone = phone
        self.shiftId = shiftId
        self.workspaceId = workspaceId
    }
}

