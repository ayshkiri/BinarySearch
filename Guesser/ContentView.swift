//
//  ContentView.swift
//  Guesser
//
//  Created by Александр Шкирин on 23.01.2023.
//

import SwiftUI



struct ContentView: View {
    
    // Максимальное значение
    @State private var max = 0
    @State private var maxVariants: [Int] = [10, 100, 1000, 10000]
    @State private var selectedVariant = 0
    // Предполагаемое значение
    @State private var maybeX = 0
    // Минимальное значение
    @State private var min = 0
    
    @State private var startText = "Загадал, начать игру!"
    // Счетчик количества попыток
    @State private var counter = 0
    
    @State private var winText = "Угадал!"
    
    var body: some View {
        VStack {
            Text("Загадайте число от 0 до:")
                .foregroundColor(.blue)
                .bold()
            Picker(selection: $selectedVariant, label: Text("")) {
                ForEach(0..<maxVariants.count) {
                    index in Text(String(self.maxVariants[index]))
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            Button(action: {
                max = maxVariants[selectedVariant]
                min = 0
                maybeX = (min + max) / 2
                startText = "Начать заново"
                winText = "Угадал!"
                counter = 1
            }){
                Text(startText)
                    .font(.title)
                    .padding(20)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
            }
            Spacer()
            Text("Ваше число: \(maybeX)")
                .foregroundColor(.blue)
                .bold()
                .font(.title)
            Button(action: {
                min = maybeX + 1
                maybeX = (min + max ) / 2
                counter += 1
            }){
                Text("Нет, мое больше")
                    .font(.title)
                    .padding(20)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
            }
            .padding()
            Button(action: {
                max = maybeX - 1
                maybeX = (min + max ) / 2
                counter += 1
            }){
                Text("Нет, мое меньше")
                    .font(.title)
                    .padding(20)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
            }
            Spacer()
            Button(action: {
                winText = "Угадал за " + String(counter) + " попыток"
            }){
                Text(winText)
                    .font(.title)
                    .padding(20)
                    .background(.yellow)
                    .clipShape(Capsule())
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
