// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVSetColorBlendFactor: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Slider(
                value: $appState.actionSetColorBlendFactor.colorBlendFactor, in: 0...1, step: 0.1,
                label: { Text("Color Blend Factor") },
                minimumValueLabel: { Text("0") },
                maximumValueLabel: { Text(String("1")) }
            )

            Text(String(format: "%.2f", appState.actionSetColorBlendFactor.colorBlendFactor))

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionSetColorBlendFactor.duration)
        }
    }
}
