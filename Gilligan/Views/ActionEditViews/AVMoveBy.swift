// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVMoveBy: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionMoveBy.translation.dx,
                    in: -100...100,
                    step: 10,
                    label: { Text("X") },
                    minimumValueLabel: { Text("-100") },
                    maximumValueLabel: { Text(String("+100")) }
                )
                
                Text(String(format: "%.2f", appState.actionMoveBy.translation.dx))
            }
            
            VStack {
                Slider(
                    value: $appState.actionMoveBy.translation.dy,
                    in: -100...100,
                    step: 10,
                    label: { Text("Y") },
                    minimumValueLabel: { Text("-100") },
                    maximumValueLabel: { Text(String("+100")) }
                )
                
                Text(String(format: "%.2f", appState.actionMoveBy.translation.dy))
            }
            
            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionMoveBy.duration)
        }
    }
}
