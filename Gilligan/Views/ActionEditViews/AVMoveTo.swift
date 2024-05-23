// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVMoveTo: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionMoveTo.position.x,
                    in: -100...100,
                    step: 10,
                    label: { Text("X") },
                    minimumValueLabel: { Text("-100") },
                    maximumValueLabel: { Text(String("+100")) }
                )
                
                Text(String(format: "%.2f", appState.actionMoveTo.position.x))
            }
            
            VStack {
                Slider(
                    value: $appState.actionMoveTo.position.y,
                    in: -100...100,
                    step: 10,
                    label: { Text("Y") },
                    minimumValueLabel: { Text("-100") },
                    maximumValueLabel: { Text(String("+100")) }
                )
                
                Text(String(format: "%.2f", appState.actionMoveTo.position.y))
            }
            
            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionMoveTo.duration)
        }
    }
}
