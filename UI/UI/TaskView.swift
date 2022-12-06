//
//  NewTaskView.swift
//  UI
//
//  Created by Harry Karl Filip Karlsson on 2022-12-05.
//

import SwiftUI

struct TaskView: View {
    @State var selectedPriority: FrequencyPicker = .daily
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .black
    }
    
    var body: some View {
        let tasks = ["one", "two", "three"]
        NavigationStack{
            
            ZStack(alignment: .top){
                
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text(Date.now, format: .dateTime.weekday())
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                        .padding(.top)
                        .textInputAutocapitalization(.words)
                    Text(Date.now, format: .dateTime.day(.defaultDigits))
                        .fontDesign(.serif)
                        .font(.system(size: 75))
                        .underline()
                        .offset(x: 0, y: -5)
                    Text(Date.now, format: .dateTime.month(.wide))
                        .fontDesign(.serif)
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .textInputAutocapitalization(.words)
                    
                    
                    PickerFrequency(selectedFrequency: $selectedPriority)
                        
                    
                    List{
                        
                        ForEach(tasks, id: \.self) { item in
                            HStack{
                                Image(systemName: "circle")
                                Text(item)
                                    .font(.title2)
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    

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



struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
