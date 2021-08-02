//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Mehmet Ali ÇAKIR on 23.07.2021.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                        
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees)
    }
}
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: History(attendees: ["John", "Darla", "Luis"], lengthInMinutes: 10, transcript: "Darla, would you like to start today? Sure, yesterday O reviewed Luis' PR AND met with the design team to finalize the UI..."))
    }
}