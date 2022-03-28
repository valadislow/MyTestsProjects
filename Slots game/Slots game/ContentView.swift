//
//  ContentView.swift
//  Slots game
//
//  Created by 1 on 3/22/22.
//

import SwiftUI

struct ContentView: View {
        
    @State private var symbols = ["apple", "cherry", "star"]
    @State private var number = [0, 1, 2 ]
    @State private var credits = 1000
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    private var betAmount = 5
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .ignoresSafeArea()
            
            VStack {
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(1)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                Spacer()
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                HStack{
                    
                    CardView(symbol: $symbols[number[0]], background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[number[1]], background: $backgrounds[1])

                    CardView(symbol: $symbols[number[2]], background: $backgrounds[2])

                }
                Spacer()
                Button(action: {
                    
                    self.backgrounds[0] = Color.white
                    self.backgrounds[1] = Color.white
                    self.backgrounds[2] = Color.white
                    
                    self.number[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.number[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.number[2] = Int.random(in: 0...self.symbols.count - 1)

                    if self.number[0] == self.number[1] && self.number[1] == self.number[2]{
                        self.credits += 50
                        
                        self.backgrounds[0] = Color.green
                        self.backgrounds[1] = Color.green
                        self.backgrounds[2] = Color.green

                    } else {
                        self.credits -= 5
                        
                    }
                        
                    
                }, label: {
                    Text("Spin")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color .white)
                        .padding(25)
                        .background(Color .yellow)
                        .padding(1)
                        .offset(x: -4, y: -4)
                        .background(Color .orange)
                })
                Spacer()
                Spacer()
            }
        }
        
       /* func random() {
            if symbols[number[0]] == symbols[number[1]] & symbols[number[2]]{
                credits + betAmount{
                } else {
                    credits - betAmount
                }
            }
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
