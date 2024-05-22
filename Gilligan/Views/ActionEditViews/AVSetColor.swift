// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AVSetColor: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            VStack {
                Slider(
                    value: $appState.actionSetColor.hue, in: 0...1, step: 0.1,
                    label: { Text("Hue") },
                    minimumValueLabel: { Text("0") },
                    maximumValueLabel: { Text(String("1")) }
                )

                Text(String(format: "%.2f", appState.actionSetColor.hue))
            }

            VStack {
                Slider(
                    value: $appState.actionSetColor.saturation, in: 0...1, step: 0.1,
                    label: { Text("Saturation") },
                    minimumValueLabel: { Text("0") },
                    maximumValueLabel: { Text(String("1")) }
                )

                Text(String(format: "%.2f", appState.actionSetColor.saturation))
            }

            VStack {
                Slider(
                    value: $appState.actionSetColor.brightness, in: 0...1, step: 0.1,
                    label: { Text("Brightness") },
                    minimumValueLabel: { Text("0") },
                    maximumValueLabel: { Text(String("1")) }
                )

                Text(String(format: "%.2f", appState.actionSetColor.brightness))
            }

            VStack {
                Slider(
                    value: $appState.actionSetColor.alpha, in: 0...1, step: 0.1,
                    label: { Text("Alpha") },
                    minimumValueLabel: { Text("0") },
                    maximumValueLabel: { Text(String("1")) }
                )

                Text(String(format: "%.2f", appState.actionSetColor.alpha))
            }

            VStack {
                Slider(
                    value: $appState.actionSetColor.colorBlendFactor, in: 0...1, step: 0.1,
                    label: { Text("Color Blend Factor") },
                    minimumValueLabel: { Text("0") },
                    maximumValueLabel: { Text(String("1")) }
                )

                Text(String(format: "%.2f", appState.actionSetColor.colorBlendFactor))
            }

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $appState.actionSetColor.duration)
        }
    }
}

#Preview {
    AVSetColor()
}
