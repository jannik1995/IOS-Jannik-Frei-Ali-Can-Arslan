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
                .background(.green)
                .cornerRadius(8)
                
                
                
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
            Spacer().frame(height: 30)
            Text("Kartenauswahl").font(.title)
            Spacer().frame(height: 30)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                Button (action:{
                    selectedEmojiSet = 0;
                    selectedSet = 0;
                }, label: {
                    Text("Smiley")
                        .padding()
                        .foregroundColor(.white)
                        .background(selectedSet == 0 ?  .blue : .gray)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                })
                .frame(width: (UIScreen.main.bounds.width/4), height: 50, alignment: .center)
                .background(selectedSet == 0 ?  .blue : .gray)
                .cornerRadius(8)
               
                Button (action:{
                    selectedEmojiSet = 1;
                    selectedSet = 1;
                }, label: {
                    Text("Tiere")
                        .padding()
                        .foregroundColor(.white)
                        .background(selectedSet == 1 ?  .blue : .gray)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                })
                .frame(width: (UIScreen.main.bounds.width/4), height: 50, alignment: .center)
                .background(selectedSet == 1 ?  .blue : .gray)
                .cornerRadius(8)
                
                Button (action:{
                    selectedEmojiSet = 2;
                    selectedSet = 2;
                }, label: {
                    Text("Flaggen")
                        .padding()
                        .foregroundColor(.white)
                        .background(selectedSet == 2 ?  .blue : .gray)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                })
                .frame(width: (UIScreen.main.bounds.width/4), height: 50, alignment: .center)
                .background(selectedSet == 2 ?  .blue : .gray)
                .cornerRadius(8)
            }
            Spacer().frame(height: 30)
            Button (action:{
                selectedEmojiSet = 3;
                selectedSet = 3;
            }, label: {
                Text("Formen")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedSet == 3 ?  .blue : .gray)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
            })
            .frame(width: (UIScreen.main.bounds.width-30), height: 50, alignment: .center)
            .background(selectedSet == 3 ?  .blue : .gray)
            .cornerRadius(8)
        }
        
    }

struct DifficultySelecion:View{
    @State private var selectedDifficultyValue: Int = Difficulty.easy.rawValue
    var body: some View{
        Spacer().frame(height: 30)
        Text("Schwierigkeitsgrad").font(.title)
        Spacer().frame(height: 30)
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
            
            Button (action:{
                selecetedDifficulty = Difficulty.easy;
                selectedDifficultyValue = 6;
            }, label: {
                Text("Leicht")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedDifficultyValue == 6 ?  .blue : .gray)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
            })
            .frame(width: (UIScreen.main.bounds.width/4), height: 50, alignment: .center)
            .background(selectedDifficultyValue == 6 ?  .blue : .gray)
            .cornerRadius(8)
            
      
            
            
            Button (action:{
                selecetedDifficulty = Difficulty.medium;
                selectedDifficultyValue = 12;
            }, label: {
                Text("Mittel")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedDifficultyValue == 12 ?  .blue : .gray)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
            })
            .frame(width: (UIScreen.main.bounds.width/4), height: 50, alignment: .center)
            .background(selectedDifficultyValue == 12 ?  .blue : .gray)
            .cornerRadius(8)
            
            
            
            
            Button (action:{
                selecetedDifficulty = Difficulty.hard;
                selectedDifficultyValue = 18;
            }, label: {
                Text("Schwer")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedDifficultyValue == 18 ?  .blue : .gray)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
            })
            .frame(width: (UIScreen.main.bounds.width/4), height: 50, alignment: .center)
            .background(selectedDifficultyValue == 18 ?  .blue : .gray)
            .cornerRadius(8)
            
            
            
            
            
            
            Spacer().frame(height: 30)
        }
    }
}
