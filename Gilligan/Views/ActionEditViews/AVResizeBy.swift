// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVResizeBy: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionResizeBy.deltaSize.width,
                    in: -10...10,
                    step: 1,
                    label: { Text("W") },
                    minimumValueLabel: { Text("-10") },
                    maximumValueLabel: { Text(String("+10")) }
                )

                Text(String(format: "%.2f", appState.actionResizeBy.deltaSize.width))
            }

            VStack {
                Slider(
                    value: $appState.actionResizeBy.deltaSize.height,
                    in: -10...10,
                    step: 1,
                    label: { Text("H") },
                    minimumValueLabel: { Text("-10") },
                    maximumValueLabel: { Text(String("+10")) }
                )

                Text(String(format: "%.2f", appState.actionResizeBy.deltaSize.height))
            }

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionResizeBy.duration)
        }
    }
}
