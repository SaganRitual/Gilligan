// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVScaleToScalar: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Slider(
                value: $appState.actionScaleToScalar.scale, in: -1...1, step: 0.1,
                label: { Text("Δ alpha") },
                minimumValueLabel: { Text("0") },
                maximumValueLabel: { Text(String("1")) }
            )

            Text(String(format: "%.2f", appState.actionScaleToScalar.scale))

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionScaleToScalar.duration)
        }
    }
}
