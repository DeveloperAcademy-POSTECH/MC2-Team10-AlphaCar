//
//  WeatherTest.swift
//  SagakSagak
//
//  Created by been on 2023/05/16.
//

import SwiftUI


struct MyButton: View {
    var weathetImageName: String
    var image: Image {
        Image(weathetImageName)
    }
    
    
    @State var weatherIsSelected: Bool
    @Binding var selectedWeatherImageName: String

    var body: some View {
        Button(action: {
            weatherIsSelected.toggle()
            selectedWeatherImageName = weatherIsSelected ? weathetImageName : "sky"
            UserDefaultsManager.shared.weather = selectedWeatherImageName
            print(UserDefaultsManager.shared.weather)
        }) {
            VStack {
                image

                    .frame(width: 60, height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                            .shadow(color: weatherIsSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: weatherIsSelected ? 5.5 : -5.5)
                            .padding(-6)
                    )

            }
            .background(weatherIsSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
            .cornerRadius(10)

        }
        .onChange(of: selectedWeatherImageName) { newValue in
            weatherIsSelected = (weathetImageName == newValue)
        }

    }
}

struct WeatherButtonView: View {
    @State var selectedWeatherImageName: String = ""

    
//    [Bool]=
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 580, height: 100)
                .foregroundColor(.white)
            HStack {
                Spacer()
                HStack(spacing: 16) {
                    
                    MyButton(weathetImageName: "snow", weatherIsSelected: selectedWeatherImageName == "snow", selectedWeatherImageName: $selectedWeatherImageName).buttonStyle(PlainButtonStyle())
                    MyButton(weathetImageName: "wind", weatherIsSelected: selectedWeatherImageName == "wind", selectedWeatherImageName: $selectedWeatherImageName).buttonStyle(PlainButtonStyle())
                    MyButton(weathetImageName: "sun", weatherIsSelected: selectedWeatherImageName == "sun", selectedWeatherImageName: $selectedWeatherImageName).buttonStyle(PlainButtonStyle())
                    MyButton(weathetImageName: "cloud", weatherIsSelected: selectedWeatherImageName == "cloud", selectedWeatherImageName: $selectedWeatherImageName).buttonStyle(PlainButtonStyle())
                    MyButton(weathetImageName: "rain", weatherIsSelected: selectedWeatherImageName == "rain", selectedWeatherImageName: $selectedWeatherImageName).buttonStyle(PlainButtonStyle())
                    MyButton(weathetImageName: "thunder", weatherIsSelected: selectedWeatherImageName == "thunder", selectedWeatherImageName: $selectedWeatherImageName).buttonStyle(PlainButtonStyle())
                }
                .frame(width: 580, alignment: .center)
                Spacer()
            }
//            Rectangle().frame(width: 200, height: 200).padding(.top, 300).foregroundColor(.white)
//                .overlay(
//                Text(UserDefaultsManager.shared.weather ?? "i'm noel").padding(.top, 300)
//                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.black.opacity(0.5))
    }
    
}




struct WeatherButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButtonView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
