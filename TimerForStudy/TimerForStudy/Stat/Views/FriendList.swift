//
//  FriendList.swift
//  TimerForStudy
//
//  Created by 김동욱 on 2023/01/09.
//

import SwiftUI

struct FriendList: View {
    @Binding var friends: [Friend]
    
    var body: some View {
        List($friends) { friend in
            FriendRow(friend: friend)
        }
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
    }
}

struct FriendList_Previews: PreviewProvider {
    static var previews: some View {
        FriendList(friends: .constant([
            .init(name: "김동욱", image: Image("User1"), isAccessEnabled: true, isPeeping: true),
            .init(name: "열목이", image: Image("User2"), isAccessEnabled: false, isPeeping: false)
        ]))
    }
}
