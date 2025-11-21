//
//  ContentView.swift
//  Spliddit
//
//  Created by Walter Lee on 11/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [.blue.opacity(0.3), .purple.opacity(0.3), .pink.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // App Icon/Logo
                    Image(systemName: "receipt.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                        .padding(40)
                        .glassEffect(.regular.tint(.blue.opacity(0.2)).interactive(), in: .circle)
                    
                    // App Title
                    VStack(spacing: 8) {
                        Text("Spliddit")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("Split bills with ease")
                            .font(.title3)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding()
                    .glassEffect(.regular, in: .rect(cornerRadius: 20))
                    
                    Spacer()
                    
                    // Action Buttons
                    VStack(spacing: 16) {
                        NavigationLink(destination: BillView()) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Create New Bill")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .buttonStyle(.glassProminent)
                        
                        NavigationLink(destination: Text("Saved Bills Coming Soon")) {
                            HStack {
                                Image(systemName: "list.bullet.rectangle.fill")
                                Text("View Saved Bills")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .buttonStyle(.glass)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
