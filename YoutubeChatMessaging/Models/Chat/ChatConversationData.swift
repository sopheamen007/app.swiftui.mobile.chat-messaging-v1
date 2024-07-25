//
//  ChatConversationData.swift
//  YoutubeChatMessaging
//
//  Created by Sopheamen VAN on 11/7/24.
//

import Foundation

let chatConversationData: [ChatConversationResponse] = [
    ChatConversationResponse(id: UUID(), text: "Hello!", isMe: true, isReaction: nil, dateTime: "10:00 AM"),
    ChatConversationResponse(id: UUID(), text: "Hi! How are you?", isMe: false, isReaction: nil, dateTime: "10:01 AM"),
    ChatConversationResponse(id: UUID(), text: "I'm good, thanks. And you?", isMe: true, isReaction: nil, dateTime: "10:02 AM"),
    ChatConversationResponse(id: UUID(), text: "Doing great! 😊", isMe: false, isReaction: true, dateTime: "10:03 AM"),
    ChatConversationResponse(id: UUID(), text: "Glad to hear that!", isMe: true, isReaction: nil, dateTime: "10:04 AM"),
    ChatConversationResponse(id: UUID(), text: "Are we still meeting tomorrow?", isMe: false, isReaction: nil, dateTime: "2:30 PM"),
    ChatConversationResponse(id: UUID(), text: "Yes, at the usual place.", isMe: true, isReaction: nil, dateTime: "2:31 PM"),
    ChatConversationResponse(id: UUID(), text: "Perfect! See you then.", isMe: false, isReaction: nil, dateTime: "2:32 PM"),
    ChatConversationResponse(id: UUID(), text: "See you! 👋", isMe: true, isReaction: true, dateTime: "2:33 PM"),
    ChatConversationResponse(id: UUID(), text: "Can't wait! 😄", isMe: false, isReaction: true, dateTime: "2:34 PM"),
    ChatConversationResponse(id: UUID(), text: "Just a reminder about the documents I emailed you.", isMe: true, isReaction: nil, dateTime: "3:15 PM"),
    ChatConversationResponse(id: UUID(), text: "Got them, I'll review by tonight.", isMe: false, isReaction: nil, dateTime: "3:20 PM"),
    ChatConversationResponse(id: UUID(), text: "Thanks! No rush, just by the end of the week.", isMe: true, isReaction: nil, dateTime: "3:22 PM"),
    ChatConversationResponse(id: UUID(), text: "Will do. And about the trip next month...", isMe: false, isReaction: nil, dateTime: "3:25 PM"),
    ChatConversationResponse(id: UUID(), text: "Still planning! We should book the flights soon.", isMe: true, isReaction: nil, dateTime: "3:27 PM"),
    ChatConversationResponse(id: UUID(), text: "Agreed. I'll look for deals and let you know.", isMe: false, isReaction: nil, dateTime: "3:29 PM"),
    ChatConversationResponse(id: UUID(), text: "I appreciate it! Talk later?", isMe: true, isReaction: nil, dateTime: "3:30 PM"),
    ChatConversationResponse(id: UUID(), text: "Sure thing. Catch you in the evening!", isMe: false, isReaction: nil, dateTime: "3:32 PM"),
    ChatConversationResponse(id: UUID(), text: "Have a good one!", isMe: true, isReaction: nil, dateTime: "3:34 PM"),
    ChatConversationResponse(id: UUID(), text: "You too! 😎", isMe: false, isReaction: true, dateTime: "3:35 PM")

]
