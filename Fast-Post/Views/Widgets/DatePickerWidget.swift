//
//  DateWidget.swift
//  Fast-Post
//
//  Created by  kraken808 on 01.03.2022.
//

import SwiftUI

struct DatePickerWidget: View {
    
    @Binding var date: Date
    
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            displayedComponents: [.date, .hourAndMinute]
        )
            .datePickerStyle(.graphical)
            .onChange(of: date) { newValue in
                print("date: ",date)
            }
    }
}

struct DateWidget_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerWidget(date: .constant(Date()))
    }
}


