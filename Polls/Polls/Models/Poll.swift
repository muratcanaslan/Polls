//
//  Poll.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

struct Poll {
    let pollId: Int
    let question: Question
    let totalVotes: Int
    var textAnswers: [TextAnswer]
    var imageAnswers: [ImageAnswer]
    
    static func createMockImage() -> UIImage {
        let images: [UIImage] = [UIImage(resource: .mockAvatar1), UIImage(resource: .mockAvatar2), UIImage(resource: .mockAvatar3), UIImage(resource: .mockAvatar4), UIImage(resource: .mockAvatar5)]
        let image = images.randomElement() ?? UIImage(resource: .mockAvatar1)
        return image
    }
    
    static func createMockProfileName() -> String {
        let names: [String] = ["Lisa Bryant", "Sophia Bennett", "Jason Statham", "Jack Sparrow", "John Smith"]
        return names.randomElement() ?? "Jason Statham"
    }
    
    static func createMockPublishedTime() -> String {
        let times: [String] = ["1 weeks ago", "17 minutes ago", "2 days ago", "2 months ago"]
        return times.randomElement() ?? "2 months ago"
    }
    
    static func createMockLastVotedTime() -> String {
        let times: [String] = ["LAST VOTED 12 MINUTES AGO", "LAST VOTED 4 SECONDS AGO", "LAST VOTED 32 SECONDS AGO", "LAST VOTED 2 HOURS AGO"]
        return times.randomElement() ?? "2 months ago"
    }
}
