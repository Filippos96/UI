//
//  ProfileView.swift
//  UI
//
//  Created by Harry Karl Filip Karlsson on 2022-12-05.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            
            ZStack(alignment: .top){
                
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Profile")
                        .fontDesign(.serif)
                        .font(.system(size: 50))
                        .underline()
                        .padding()
                    Spacer()
                    Image(systemName: "person.crop.circle")
                    
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Text("Username")
                        .font(.title)
                    Spacer()
                    Text("Level:")
                    ProgressView("", value: 10, total: 100)
                        .progressViewStyle(GaugeProgressStyle())
                        
                    Spacer()
                    HStack{
                        Spacer()
                        Image(systemName: "trophy.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Spacer()
                        Image(systemName: "medal.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Spacer()
                    }
                    Spacer()
                    
                }
                .navigationTitle("Daily Discipline")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button {
                            //showNewTaskSheet.toggle()
                        } label: {
                            Label("Add Item", systemImage: "gearshape.fill")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            //NewTestView()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                    }
                }
                .foregroundColor(.black)
            }
            
        }
        
    }
}

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Path { path in
                path.move(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 300, y: 0))
            }
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
