//
//  MainPageView.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI

struct MainPage: View {
    @State var buttonTextSize: CGFloat = 16
    @State var buttonHeight: CGFloat = 45
    @State var buttonWidth: CGFloat = 170
    
    var body: some View {
            ZStack {
                //Set background color
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Text("MemoryLane")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170)
                    
                    //Features section
                    Text("Features:")
                        .font(.system(size: 23))
                        .bold()
                        .padding(.top, 40)
                        .foregroundColor(.white)
                    
                    VStack {
                        NavigationLink(destination: DailyTasks()) {
                            Text("Daily Tasks")
                                .bold()
                                .font(.system(size: buttonTextSize))
                                .frame(width: buttonWidth, height: buttonHeight)
                                .foregroundColor(Color.black)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(8)
                        }
                        
                        NavigationLink(destination: Memories()) {
                            Text("Memories")
                                .bold()
                                .font(.system(size: buttonTextSize))
                                .frame(width: buttonWidth, height: buttonHeight)
                                .foregroundColor(Color.black)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(8)
                        }
                        
                        // Quiz button in the bottom left corner
                        HStack {
                            NavigationLink(destination: Quiz()) {
                                Text("Quiz")
                                    .bold()
                                    .font(.system(size: buttonTextSize))
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .foregroundColor(Color.black)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(8)
                            }
                            
                        }
                        
                        
                        //Coming soon section
                        Text("Coming soon:")
                            .font(.system(size: 23))
                            .bold()
                            .padding(.top, 40)
                            .foregroundColor(.white)
                        
                        Button(action: {}) {
                            Text("Soothing Songs")
                                .bold()
                                .font(.system(size: buttonTextSize))
                                .frame(width: buttonWidth, height: buttonHeight)
                                .foregroundColor(Color.black)
                                .background(Color.red.opacity(0.3))
                                .cornerRadius(8)
                                
                        }
                        
                        Button(action: {}) {
                            Text("Memory Games")
                                .bold()
                                .font(.system(size: buttonTextSize))
                                .frame(width: buttonWidth, height: buttonHeight)
                                .foregroundColor(Color.black)
                                .background(Color.red.opacity(0.3))
                                .cornerRadius(8)
                            
                        }
                        
                        Button(action: {}) {
                            Text("Engaging Stories")
                                .bold()
                                .font(.system(size: buttonTextSize))
                                .frame(width: buttonWidth, height: buttonHeight)
                                .foregroundColor(Color.black)
                                .background(Color.red.opacity(0.3))
                                .cornerRadius(8)
                                
                        }
                        
                    }
                }
                
            }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
