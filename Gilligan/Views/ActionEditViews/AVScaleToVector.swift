// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVScaleToVector: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionScaleToVector.scale.dx,
                    in: 10...100,
                    step: 10,
                    label: { Text("W") },
                    minimumValueLabel: { Text("10") },
                    maximumValueLabel: { Text(String("100")) }
                )

                Text(String(format: "%.2f", appState.actionScaleToVector.scale.dx))
            }

            VStack {
                Slider(
                    value: $appState.actionScaleToVector.scale.dy,
                    in: 10...100,
                    step: 10,
                    label: { Text("H") },
                    minimumValueLabel: { Text("10") },
                    maximumValueLabel: { Text(String("100")) }
                )

                Text(String(format: "%.2f", appState.actionScaleToVector.scale.dy))
            }

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionScaleToVector.duration)
        }
    }
}
