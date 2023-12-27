//
//  ContentView.swift
//  AlMisbaha
//
//  Created by Ali Hodroj on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counterNum: Int = 0
    @State private var showingHelpAlert = false
    @State private var showingSaveAlert = false
    @State private var showingResetAlert = false
    @State private var showingRestoreAlert = false
    
    var body: some View {
        // MARK: Main View
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            // MARK: Main VStack
            VStack {
                // MARK: Header
                HStack(alignment: .center) {
                    // MARK: App Title
                    Text("Al Misbaha")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    // MARK: Help Icon
                    Button {
                        showingHelpAlert = true
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.largeTitle)
                            .padding(.horizontal)
                    }
                    .alert("Click Anywhere On The Screen To Add To The Counter!", isPresented: $showingHelpAlert) {
                        Button("Ok", role: .cancel) { }
                    }
                }
                
                Spacer()
                
                // MARK: Counter Text
                if counterNum < 1000 {
                    Text(String(counterNum))
                        .font(.system(size: 180))
                        .padding(.vertical)
                        .foregroundColor(.green)
                } else if counterNum >= 1000 && counterNum < 10000 {
                    Text(String(counterNum))
                        .font(.system(size: 150))
                        .padding(.vertical)
                        .foregroundColor(.green)
                } else if counterNum >= 10000 {
                    Text(String(counterNum))
                        .font(.system(size: 100))
                        .padding(.vertical)
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                // MARK: Button HStack
                HStack {
                    // MARK: Save Button
                    Button {
                        showingSaveAlert = true
                    } label: {
                        Text("SAVE")
                            .frame(width: 110, height: 40)
                            .background(.green)
                            .foregroundColor(Color("background"))
                            .cornerRadius(20)
                    }
                    .alert(isPresented: $showingSaveAlert) {
                        Alert(title: Text("Save the counter?"), primaryButton: .cancel(), secondaryButton: .default(Text("Yes"), action: {
                            UserDefaults.standard.set(counterNum, forKey: "counterNum")
                        }))
                    }
                    
                    // MARK: Reset Button
                    Button {
                        showingResetAlert = true
                    } label: {
                        Text("RESET")
                            .frame(width: 110, height: 40)
                            .background(.green)
                            .foregroundColor(Color("background"))
                            .cornerRadius(20)
                    }
                    .alert(isPresented: $showingResetAlert) {
                        Alert(title: Text("Reset the counter?"), primaryButton: .cancel(), secondaryButton: .default(Text("Yes"), action: {
                            counterNum = 0
                        }))
                    }
                    
                    // MARK: Restore Button
                    Button {
                        showingRestoreAlert = true
                    } label: {
                        Text("RESTORE")
                            .frame(width: 110, height: 40)
                            .background(.green)
                            .foregroundColor(Color("background"))
                            .cornerRadius(20)
                    }
                    .alert(isPresented: $showingRestoreAlert) {
                        Alert(title: Text("Restore the counter?"), primaryButton: .cancel(), secondaryButton: .default(Text("Yes"), action: {
                            counterNum = UserDefaults.standard.integer(forKey: "counterNum")
                        }))
                    }
                }
            }
            .background(Color("background"))
            .onTapGesture {
                counterNum += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
