//
//  ProfileImageView.swift
//  YoutubeChatMessaging
//
//  Created by Sopheamen VAN on 11/7/24.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    let profileImageUrl: String
    let size: CGFloat
    
    var body: some View {
        KFImage(URL(string: profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

#Preview {
    ProfileImageView(profileImageUrl: currentUserData.profileUrl, size: 40)
}
