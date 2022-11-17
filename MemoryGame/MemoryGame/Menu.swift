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
private var selectedEmojiSet = 0;
private var selecetedDifficulty = Difficulty.easy;



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
                    viewModel.newGame(EmojiSet: selectedEmojiSet, Difficulty: selecetedDifficulty)
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
        @State private var selectedSet: Int = selectedEmojiSet
        var body: some View{
            Text("Emoji Auswahl")
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                Button(action: {
                    selectedEmojiSet = 0;
                    selectedSet = 0;
                }, label: {
                  Text("Faces")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedSet == 0 ?  .blue : .gray)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                Button(action: {
                    selectedEmojiSet = 1;
                    selectedSet = 1;
                }, label: {
                  Text("Animals")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedSet == 1 ?  .blue : .gray)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                Button(action: {
                    selectedEmojiSet = 2;
                    selectedSet = 2;
                }, label: {
                  Text("Shapes")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedSet == 2 ?  .blue : .gray)
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
                selecetedDifficulty = Difficulty.easy;
            }, label: {
              Text("Leicht")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            Button(action: {
                selecetedDifficulty = Difficulty.medium;
            }, label: {
              Text("Mittel")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            Button(action: {
                selecetedDifficulty = Difficulty.hard;
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
