//
//  CountdownView.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt on 2/1/23.
//

import SwiftUI

struct CountdownView: View {
    
   
    var body: some View {
        NavigationView {
            VStack {
                
                Text("\(getNumberOfDaysUntilEndOfSemester()) Days till summer!")
                    .frame(width: 350, height: 50, alignment: .center)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    
                
            }
            
        }
    }
}

func getNumberOfDaysUntilEndOfSemester() -> Int
        {
            
            
            let finalSemesterDateDateComponents = DateComponents(month: 6, day: 1, hour: 23, minute: 59, second: 59) //May 31st date +1 counting today
            
            let currentDate = Date() //today -> day 246...and increasing...
            
            if let nextFinalSemesterDate = Calendar.current.nextDate(after: currentDate, matching: finalSemesterDateDateComponents, matchingPolicy: .strict),
               let daysUntilNextFinalSemesterDate = Calendar.current.dateComponents([.day], from: currentDate, to: nextFinalSemesterDate).day {
                return daysUntilNextFinalSemesterDate
            }
            
            return 0
        }


struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
