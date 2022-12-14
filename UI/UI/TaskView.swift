//
//  NewTaskView.swift
//  UI
//
//  Created by Harry Karl Filip Karlsson on 2022-12-05.
//

import SwiftUI

struct TaskView: View {
    @State var selectedPriority: FrequencyPicker = .daily
    @AppStorage ("currentDay") var currentDay: String?
    
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
            .onAppear{
                updateTasksWhenNewDay()
            }
        }
    }
}

func getDate() -> String{
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    let dateInString = dateFormatter.string(from: date)
    
    print(dateInString)
    return dateInString
    
}

func dayHasChanged(){
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    let dateInString = dateFormatter.string(from: date)
    
    print(dateInString)
    
    if dateInString != UserDefaults.standard.string(forKey: "day"){
        //Set all daily task Completions to false
        print("New Day")
        
        
    }
}
func weekHasChanged(){
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ww"
    let dateInString = dateFormatter.string(from: date)
    
    if dateInString != UserDefaults.standard.string(forKey: "week"){
        //Set all wekkly task Completions to false
        
        print("New week")
    }
}
func monthHasChanged(){
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM"
    let dateInString = dateFormatter.string(from: date)
    
    if dateInString != UserDefaults.standard.string(forKey: "month"){
        //Set all monthly task Completions to false
        
        print("New Month")
    }
}

func saveDate(){
    let date = Date()
    let dateFormatterToDay = DateFormatter()
    let dateFormatterToWeek = DateFormatter()
    let dateFormatterToMonth = DateFormatter()
    
    dateFormatterToDay.dateFormat = "dd"
    dateFormatterToWeek.dateFormat = "ww"
    dateFormatterToMonth.dateFormat = "MM"
    
    let dayInString = dateFormatterToDay.string(from: date)
    let WeekInString = dateFormatterToWeek.string(from: date)
    let MonthInString = dateFormatterToMonth.string(from: date)
    
    UserDefaults.standard.set(dayInString, forKey: "day")
    UserDefaults.standard.set(WeekInString, forKey: "week")
    UserDefaults.standard.set(MonthInString, forKey: "month")
}

func updateTasksWhenNewDay(){
    dayHasChanged()
    weekHasChanged()
    monthHasChanged()
    saveDate()
}



func setDayToZero(){
    UserDefaults.standard.set("00", forKey: "day")
}



struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
