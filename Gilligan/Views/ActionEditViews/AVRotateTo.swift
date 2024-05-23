// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVRotateTo: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Slider(
                value: $appState.actionRotateTo.angle,
                in: (-2 * Double.pi)...(2 * Double.pi),
                step: Double.pi / 4,
                label: { Text("Θ") },
                minimumValueLabel: { Text("-2π") },
                maximumValueLabel: { Text(String("+2π")) }
            )

            Text(String(format: "%.2f", appState.actionRotateTo.angle))

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionRotateTo.duration)
        }
    }
}
