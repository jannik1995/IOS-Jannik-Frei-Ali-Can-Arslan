//
//  Menu.swift
//  MemoryGame
//
//  Created by Ali Can Arslan on 27.10.22.
//

import SwiftUI

private let minimumColumnWidth = Double(100)
private var selctedEmojiSet = "Emoticon";
private var selcetedDifficulty = "Mittel";

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
                    viewModel.resetGame()
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
        @State private var showingSheet = false
        @ObservedObject
        var viewModel: EmojiMemoryGameViewModel
        
        var body: some View {
            Button("Menü") {
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
                    selctedEmojiSet = "Emoticons";
                }, label: {
                  Text("Emoticons")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                Button(action: {
                    selctedEmojiSet = "Misc Symbols and Pictographs";
                }, label: {
                  Text("Misc Symbols and Pictographs")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                Button(action: {
                    selctedEmojiSet = "Regional country flags";
                }, label: {
                  Text("Regional country flags")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 100, height: 200)
                })
                
                /*
                Button("Variation selector"){
                    selctedSet = "Variation selector";
                }
                Button("Misc items"){
                    
                }
                Button("Combining Diacritical Marks for Symbols"){
                    
                }
                 */
            }
        }
    }

struct DifficultySelecion:View{
    var body: some View{
        Text("Schwierigkeitsgrad")
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
            Button(action: {
                selcetedDifficulty = "Leicht";
            }, label: {
              Text("Leicht")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            Button(action: {
                selcetedDifficulty = "Mittel";
            }, label: {
              Text("Mittel")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .frame(width: 100, height: 200)
            })
            Button(action: {
                selcetedDifficulty = "Schwer";
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
