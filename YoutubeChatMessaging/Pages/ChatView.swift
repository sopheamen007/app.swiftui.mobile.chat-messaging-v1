//
//  ChatView.swift
//  YoutubeChatMessaging
//
//  Created by Sopheamen VAN on 11/7/24.
//

import SwiftUI

struct ChatView: View {
    // load chat user row
    var chatAllDatas:[ChatResponse] = chatData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // content here
                VStack {
                    VStack (spacing: 10){
                        // header
                        HStack {
                            Text("Broadcast Lists")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.primaryColor)
                            Spacer()
                            Text("New Group")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.primaryColor)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        // list chat users
                        LazyVStack {
                            ForEach(chatAllDatas){ item in
                                NavigationLink (destination: ChatDetailView(chatResponse: item)){
                                    VStack (spacing: 5){
                                        ChatRowView(chatResponse: item)
                                            .padding(.horizontal)
                                        Divider()
                                            .padding(.leading, 100)
                                    }
                                }
                            }
                        }
                        
                        
                    }
                }
            }
            .navigationTitle("Chats")
            .toolbar {
                // leading
                ToolbarItem (placement: .topBarLeading){
                    Button {
                        // action
                    } label: {
                        Text("Edit")
                            .fontWeight(.semibold)
                    }
                }
                // trailing
                ToolbarItem (placement: .topBarTrailing){
                    HStack (spacing: 20){
                        Button {
                            // action
                        } label: {
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                        }
                        //
                        Button {
                            // action
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 22, height: 20)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    ChatView()
}

struct ChatRowView: View {
    let chatResponse: ChatResponse
    
    var body: some View {
        HStack (spacing: 5){
            // profile url
            ProfileImageView(profileImageUrl: chatResponse.user.profileUrl, size: 60)
                .overlay(Circle().stroke(.gray.opacity(0.15)))
            
            // username and text
            VStack (alignment: .leading,spacing: 0){
                Text(chatResponse.user
                    .name)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                
                HStack (spacing: 6){
                    IconTypeView(type: chatResponse.type)
                    Text(chatResponse.text ?? "")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.black.opacity(0.6))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .padding(.leading, 10)
            
            // time ago and badge
            VStack (alignment: .trailing, spacing: -3){
                if chatResponse.badgeNumber != nil {
                    Text(chatResponse.timeAgo)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.primaryColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }else {
                    Text(chatResponse.timeAgo)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.black.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                // badge number
                if let badgeNumber = chatResponse.badgeNumber, badgeNumber > 0 {
                    ZStack {
                        Circle()
                            .fill(Color.primaryColor)
                            .frame(width: 22, height: 22)
                        Text("\(badgeNumber)")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top,8)
                }
            }
            .frame(width: 80)
           
        }
    }
}

struct IconTypeView: View {
    var type: Int
    var body: some View {
        switch type {
        case 1:
            Image(systemName: "checkmark")
                .resizable()
                .scaledToFill()
                .frame(width: 12, height: 12)
                .foregroundStyle(.gray)
                .padding(.top, 3)
        case 2:
            Image(systemName: "phone.arrow.down.left.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 13, height: 13)
                .foregroundStyle(Color.dangerColor)
                .padding(.top, 3)
        case 3:
            Image(systemName: "mic.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.chatColor)
                .padding(.top, 3)
        default:
            Text("")
        }
    }
}
