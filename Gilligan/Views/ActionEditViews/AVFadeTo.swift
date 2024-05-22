// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVFadeTo: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Slider(
                value: $appState.actionFadeTo.alpha, in: 0...1, step: 0.1,
                label: { Text("Alpha") },
                minimumValueLabel: { Text("0") },
                maximumValueLabel: { Text(String("1")) }
            )

            Text(String(format: "%.2f", appState.actionFadeTo.alpha))

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionFadeTo.duration)
        }
    }
}
