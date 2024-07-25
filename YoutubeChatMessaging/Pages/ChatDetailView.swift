//
//  ChatDetailView.swift
//  YoutubeChatMessaging
//
//  Created by Sopheamen VAN on 11/7/24.
//

import SwiftUI

struct ChatDetailView: View {
    // back button trigger
    @Environment(\.dismiss)  var dismiss
    var chatResponse: ChatResponse
    var chatConversation:[ChatConversationResponse] = chatConversationData
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottom){

                // add background
                Image("chat_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
                
                // content here
                ScrollView {
                    VStack {
                        // setting header
                        SettingHeaderView()
                            .padding(.vertical,10)
                        Spacer()
                        // chat bubble
                        LazyVStack (spacing: 10){
                            ForEach(chatConversation) { conversation in
                                BubbleChatView(conversation: conversation)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 80)
                
                // footer floating
                FooterFloatingView()
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
            .toolbar {
                // leading
                ToolbarItem (placement: .topBarLeading){
                    HStack {
                        Button {
                            // action
                            dismiss()
                        }label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.primaryColor)
                                .padding(.top,4)
                            
                        }
                        // profile image
                        HStack {
                            ProfileImageView(profileImageUrl: chatResponse.user.profileUrl, size: 40)
                            Text(chatResponse.user.name)
                                .font(.headline)
                        }
                    }
                }
                // trailing
                ToolbarItem (placement: .topBarTrailing){
                    HStack (spacing: 20){
                        Button {
                            
                        }label: {
                            Image(systemName: "video")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                        }
                        .padding(.top, 3)
                        
                        Button {
                            
                        }label: {
                            Image(systemName: "phone")
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
    ChatDetailView(chatResponse: chatData[0])
}

struct SettingHeaderView: View {
    var body: some View {
        VStack (spacing: 12){
            Text("Today")
                .font(.footnote)
                .padding(.vertical,2)
                .padding(.horizontal)
                .background(Color.todayChatBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack (alignment: .top, spacing: 10){
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 8, height: 8)
                    .padding(.top,6)
                Text("Messages and calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Tap to learn more.")
                    .font(.footnote)
            }
            .padding(.vertical,4)
            .padding(.horizontal)
            .background(Color.settingChatBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal,30)
        }
    }
}

struct BubbleChatView: View {
    var conversation: ChatConversationResponse
    
    var body: some View {
        if conversation.isMe {
            HStack {
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    VStack(alignment: .leading) {
                        Text(conversation.text)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                    .padding(.vertical,7)
                    .padding(.horizontal,12)
                    .background(Color.meChatBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 0.1))
                    .shadow(color: .black.opacity(0.08), radius: 0, x: 0, y: 1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    // reaction here
                    if conversation.isReaction != nil {
                        Text("😆")
                            .font(.footnote)
                            .padding(.all, 4)
                            .background(.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.gray.opacity(0.1)))
                            .offset(x:-15, y:20)
                    }
                }
            }
            
        }else {
            HStack {
                ZStack (alignment: .bottomLeading){
                    VStack(alignment: .leading) {
                        Text(conversation.text)
                            .font(.subheadline)
                            .foregroundColor(.black)
                          
                    }
                    .padding(.vertical,7)
                    .padding(.horizontal,12)
                    .background(Color.textFieldBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 0.1)
                    )
                    .shadow(color: Color.black.opacity(0.08), radius: 0, x: 0, y: 1)
                    .frame(maxWidth: .infinity,alignment: .leading)
                   
                    // reaction
                    if conversation.isReaction != nil {
                        Text("😆")
                            .font(.footnote)
                            .padding(.all,4)
                            
                            .background(Color.white)
                            .clipShape(Circle())
                           
                            .overlay(Circle().stroke(.gray.opacity(0.1)))
                            .offset(x: 15, y:20)
                    }
                }
                Spacer()
                
              
            }
        }
    }
}

struct FooterFloatingView: View {
    @State private var sendMessageText = ""
    var body: some View {
        VStack {
            HStack (spacing: 20){
                // plus button
                Button {
                    
                }label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryColor)
                }
                
                // textfield
                HStack(spacing: 0) {
                    TextField("", text: $sendMessageText)
                        .padding(.all,4)
                    Spacer()
                    HStack (spacing: 20){
                        Button {
                            
                        }label: {
                            Image(systemName: "paperplane")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.primaryColor)
                        }
                    }
                   
                }
                .padding(.horizontal,12)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(.gray.opacity(0.3)))
                
                // camera and mic
                Button {
                    
                }label: {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryColor)
                }
                Button {
                    
                }label: {
                    Image(systemName: "mic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color.primaryColor)
                }
            }
            .padding(.horizontal)
            .padding(.vertical,10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 85)
        .background(.white)
    }
}
