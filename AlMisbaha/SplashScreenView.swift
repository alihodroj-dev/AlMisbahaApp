//
//  SlashScreenView.swift
//  AlMisbaha
//
//  Created by Ali Hodroj on 03/04/2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var scaleNum: Double = 1.0
    @State private var opacityNum: Double = 1.0
    
    var body: some View {
        
        ZStack {
            
            ContentView()
            
            Color("background")
                .ignoresSafeArea()
                .opacity(opacityNum)
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding()
                .scaleEffect(scaleNum)
                .opacity(opacityNum)
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                withAnimation(.spring()) {
                    scaleNum = 0.8
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    withAnimation() {
                        opacityNum = 0
                        scaleNum = 100.0
                    }
                })
            })
        }
    }
}

struct SlashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
