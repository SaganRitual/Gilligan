// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVResizeTo: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionResizeTo.size.width,
                    in: 10...100,
                    step: 10,
                    label: { Text("W") },
                    minimumValueLabel: { Text("10") },
                    maximumValueLabel: { Text(String("100")) }
                )

                Text(String(format: "%.2f", appState.actionResizeTo.size.width))
            }

            VStack {
                Slider(
                    value: $appState.actionResizeTo.size.height,
                    in: 10...100,
                    step: 10,
                    label: { Text("H") },
                    minimumValueLabel: { Text("10") },
                    maximumValueLabel: { Text(String("100")) }
                )

                Text(String(format: "%.2f", appState.actionResizeTo.size.height))
            }

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionResizeTo.duration)
        }
    }
}
