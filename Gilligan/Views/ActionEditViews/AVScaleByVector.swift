// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVScaleByVector: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionScaleByVector.scale.dx,
                    in: -10...10,
                    step: 1,
                    label: { Text("W") },
                    minimumValueLabel: { Text("-10") },
                    maximumValueLabel: { Text(String("+10")) }
                )

                Text(String(format: "%.2f", appState.actionScaleByVector.scale.dx))
            }

            VStack {
                Slider(
                    value: $appState.actionScaleByVector.scale.dy,
                    in: -10...10,
                    step: 1,
                    label: { Text("H") },
                    minimumValueLabel: { Text("-10") },
                    maximumValueLabel: { Text(String("+10")) }
                )

                Text(String(format: "%.2f", appState.actionScaleByVector.scale.dy))
            }

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionScaleByVector.duration)
        }
    }
}
