//
//  Menu.swift
//  MemoryGame
//
//  Created by Ali Can Arslan on 27.10.22.
//

import SwiftUI

enum Difficulty: Int{
    case easy = 6
    case medium = 12
    case hard = 18
}

private let minimumColumnWidth = Double(100)
private var selctedEmojiSet = 0;
private var selcetedDifficulty = Difficulty.easy;



struct Menu: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject
    var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            ScrollView{
                EmojiSelection()
                DifficultySelecion()
                Button("Spiel starten") {
                    viewModel.newGame(EmojiSet: selctedEmojiSet, Difficulty: selcetedDifficulty)
                    dismiss()
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                
            }
            
        }
    }
    }
    
    struct ContentView: View {
        @State private var showingSheet = true
        @ObservedObject
        var viewModel: EmojiMemoryGameViewModel
        
        var body: some View {
            Button("Neues Spiel") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                Menu(viewModel: viewModel)
            }
        }
    }
    
    struct EmojiSelection:View{
        var body: some View{
            Text("Emoji Auswahl")
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                Button(action: {
                    selctedEmojiSet = 0;
                }, label: {
                  Text("🦁")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                Button(action: {
                    selctedEmojiSet = 1;
                }, label: {
                  Text("Misc Symbols and Pictographs")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                Button(action: {
                    selctedEmojiSet = 2;
                }, label: {
                  Text("Regional country flags")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                
            }
        }
    }

struct DifficultySelecion:View{
    var body: some View{
        Text("Schwierigkeitsgrad")
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
            Button(action: {
                selcetedDifficulty = Difficulty.easy;
            }, label: {
              Text("Leicht")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            Button(action: {
                selcetedDifficulty = Difficulty.medium;
            }, label: {
              Text("Mittel")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            Button(action: {
                selcetedDifficulty = Difficulty.hard;
            }, label: {
              Text("Schwer")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            
        }
    }
}
