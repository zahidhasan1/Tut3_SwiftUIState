//
//  ContentView.swift
//  Tut3_SwiftUIState
//
//  Created by ZEUS on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying: Bool = true
    @State private var tapCountRed: Int = 0
    @State private var tapCountGreen: Int = 0
    @State private var tapCountBlue: Int = 0


    var body: some View {
        VStack {
            Button {
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ?"stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor( isPlaying ? .red : .green)
        }
            VStack {
                Text("\(tapCountRed + tapCountGreen + tapCountBlue)")
                    .font(.system(size: 80, weight: .black, design: .rounded))
                HStack {
                    ExtractedView(counter: $tapCountRed, color: .red)
                    ExtractedView(counter: $tapCountGreen, color: .green)
                    ExtractedView(counter: $tapCountBlue, color: .accentColor)
                }
            }
            Spacer()
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @Binding var counter: Int
    var color: Color
    var body: some View {
        Button {
            counter += 1
        } label: {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
        }
    }
}
