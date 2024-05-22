// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVFadeBy: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Slider(
                value: $appState.actionFadeBy.delta, in: -1...1, step: 0.1,
                label: { Text("Δ alpha") },
                minimumValueLabel: { Text("0") },
                maximumValueLabel: { Text(String("1")) }
            )

            Text(String(format: "%.2f", appState.actionFadeBy.delta))

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionFadeBy.duration)
        }
    }
}
