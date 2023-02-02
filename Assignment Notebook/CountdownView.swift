//
//  CountdownView.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt on 2/1/23.
//

import SwiftUI

struct CountdownView: View {
    
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Text("Time: \(timeRemaining)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                    
                    ZStack {
                        
                    }
                    .onReceive(timer) {time in
                        guard isActive else {return}
                        
                        if timeRemaining > 0
                        {
                            timeRemaining -= 1
                        }
                    }
                    .onChange(of: scenePhase) { newPhase in
                        if newPhase == .active {
                            isActive = true
                        } else {
                            isActive = false
                        }
                    }
                    
                }
            }
        }
        
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
