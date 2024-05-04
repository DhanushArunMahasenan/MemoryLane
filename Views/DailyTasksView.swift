//
//  DailyTasksView.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI
import AVKit

struct DailyTasks: View {
    @State var videoSize: CGFloat = 300
    @State var bottomSpacing: CGFloat = 20
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    //Title of view
                    Text("Daily Tasks")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, bottomSpacing)
                    .foregroundColor(.white)

                    
                    //What is the view for
                    Text("You can see day to day tasks in short comprehensible clips. To view the video tap the image.")
                        .bold()
                        .font(.system(size: 14))
                        .padding(.bottom, bottomSpacing)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    
                    //Descript of brushing clip
                    Text("How to brush your teeth:")
                        .foregroundColor(Color(red: 150/255, green: 230/255, blue: 255/255))
                    
                    //Importing video
                    if let videoURL = Bundle.main.url(forResource: "BrushingClip", withExtension: "mp4", subdirectory: "Data/DailyTasksClips") {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(width: videoSize, height: videoSize)
                            .padding(.bottom, bottomSpacing)
                    } else {
                        Text("Video not found")
                    }
                    
                    //Descript of drinking clip
                    Text("How to drink water:")
                        .foregroundColor(Color(red: 255/255, green: 140/255, blue: 0/255))
                    
                    //Importing video
                    if let videoURL = Bundle.main.url(forResource: "DrinkingClip", withExtension: "mp4", subdirectory: "Data/DailyTasksClips") {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(width: videoSize, height: videoSize)
                            .padding(.bottom, bottomSpacing)
                    } else {
                        Text("Video not found")
                    }
                    
                    //Descript of eating clip
                    Text("How to eat:")
                        .foregroundColor(Color(red: 255/255, green: 140/255, blue: 0/255))
                    
                    //Descript of eating clip
                    if let videoURL = Bundle.main.url(forResource: "EatingClip", withExtension: "mp4", subdirectory: "Data/DailyTasksClips") {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(width: videoSize, height: videoSize)
                            .padding(.bottom, bottomSpacing)
                    } else {
                        Text("Video not found")
                    }
                    
                    //Descript of sitting clip
                    Text("How to sit: ")
                        .foregroundColor(Color(red: 150/255, green: 230/255, blue: 255/255))
                    
                    //Importing video
                    if let videoURL = Bundle.main.url(forResource: "SittingClip", withExtension: "mp4", subdirectory: "Data/DailyTasksClips") {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(width: videoSize, height: videoSize)
                            .padding(.bottom, bottomSpacing)
                    } else {
                        Text("Video not found")
                    }
                    
                    //Descript of standing clip
                    Text("How to stand: ")
                        .foregroundColor(Color(red: 255/255, green: 127/255, blue: 80/255))
                    
                    //Importing video
                    if let videoURL = Bundle.main.url(forResource: "StandingClip", withExtension: "mp4", subdirectory: "Data/DailyTasksClips") {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(width: videoSize, height: videoSize)
                            .padding(.bottom, bottomSpacing)
                    } else {
                        Text("Video not found")
                    }
                    
                }
                
            }
            
        }
    }
}

struct DailyTasks_Previews: PreviewProvider {
    static var previews: some View {
        DailyTasks()
    }
}





