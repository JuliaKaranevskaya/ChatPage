//
//  ChatViewController.swift
//  ChatPage
//
//  Created by Юлия Караневская on 3.07.21.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let oneUser = Sender(senderId: "1", displayName: "Steve")
    let anotherUser = Sender(senderId: "2", displayName: "Steve")
    var messages: [MessageType] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messages.append(Message(sender: oneUser, messageId: "1", sentDate: Date(), kind: .text("Hello")))
        messages.append(Message(sender: anotherUser, messageId: "2", sentDate: Date(), kind: .text("How are you doing")))
        messages.append(Message(sender: oneUser, messageId: "3", sentDate: Date(), kind: .text("I'm ok. Developing a new application. Hope it'll work perfectly!")))
        messages.append(Message(sender: anotherUser, messageId: "4", sentDate: Date(), kind: .text("Wow! What kind of application?")))
        messages.append(Message(sender: oneUser, messageId: "5", sentDate: Date(), kind: .text("It's chatApp.")))
        messages.append(Message(sender: anotherUser, messageId: "6", sentDate: Date(), kind: .text("Crazy stuff!!!))))))")))
        messages.append(Message(sender: oneUser, messageId: "7", sentDate: Date(), kind: .text("Yeah))))")))

      
    }
    
    func currentSender() -> SenderType {
        return oneUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    


}
