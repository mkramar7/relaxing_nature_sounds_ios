//
//  ContentView.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 19/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var currentlyPlaying: UUID?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List {
                    ForEach(AudioStore.allSounds) { sound in
                        Button(action: {
                            if (self.currentlyPlaying == sound.id) {
                                self.currentlyPlaying = nil
                                AudioPlayer.shared.stopPlayingSound()
                            } else {
                                self.currentlyPlaying = sound.id
                                AudioPlayer.shared.playSound(sound)
                            }
                        }) {
                            ZStack(alignment: .leading) {
                                Image(sound.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .opacity(self.isCurrentlyPlaying(sound) ? 1 : 0.8)
                                    .cornerRadius(8)
                                    .animation(.spring())
                                
                                Triangle()
                                    .fill(Color.white)
                                    .frame(width: 70, height: 35)
                                    .rotationEffect(.degrees(90.0))
                                    .opacity(self.isCurrentlyPlaying(sound) ? 0.8 : 0)
                                    .padding(.leading, -17)
                                    .offset(x: 0, y: 5)
                                    .animation(.spring())
                                
                                Text("\(sound.name)")
                                    .font(Font.custom("Noteworthy", size: 50))
                                    .foregroundColor(.white)
                                    .opacity(self.isCurrentlyPlaying(sound) ? 1 : 0.8)
                                    .padding(.leading, self.isCurrentlyPlaying(sound) ? 40 : 10)
                                    .animation(.spring())
                            }
                            .padding(3)
                            .listRowInsets(EdgeInsets())
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                if UIApplication.shared.windows.first!.safeAreaInsets.bottom > 0 {
                    googleBannerWithBackground()
                } else {
                    googleBanner()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: Button(action: {
                    // TODO: Do something later...
            }) {
                Image(systemName: "clock")
                    .resizable()
                    .scaleEffect(1.4)
            }, trailing: Button(action: {
                // TODO: Do something later...
            }) {
               Image(systemName: "info.circle")
                    .resizable()
                    .scaleEffect(1.4)
            })
            .navigationBarTitle("Sounds of Nature")
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }

    }
    
    func googleBanner() -> some View {
        GoogleAdBanner()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
    }
    
    func googleBannerWithBackground() -> some View {
        VStack {
            googleBanner()
            VisualEffectView(effect: UIBlurEffect(style: .dark)).padding(0).edgesIgnoringSafeArea(.all)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: (50 + UIApplication.shared.windows.first!.safeAreaInsets.bottom))
        .padding(0)
    }
    
    func isCurrentlyPlaying(_ sound: Sound) -> Bool {
        self.currentlyPlaying == sound.id
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
