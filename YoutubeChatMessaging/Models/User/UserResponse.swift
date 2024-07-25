//
//  UserResponse.swift
//  YoutubeChatMessaging
//
//  Created by Sopheamen VAN on 11/7/24.
//

import Foundation

struct UserResponse: Hashable, Identifiable {
    var id: UUID
    var name: String
    var profileUrl: String
}
