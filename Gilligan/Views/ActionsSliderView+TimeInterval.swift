// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct ActionsSliderViewTimeInterval: View {
    @State private var range: ClosedRange<TimeInterval>
    @Binding var value: TimeInterval

    let title: String

    init(title: String, range: ClosedRange<TimeInterval> = 0...1, value: Binding<TimeInterval>) {
        self.range = range
        self.title = title
        self._value = value
    }

    var body: some View {
        VStack {
            Slider(
                value: $value,
                in: range,
                step: 0.1
            ) {
                Text(title)
            } minimumValueLabel: {
                Text(String(format: "%-.0f", range.lowerBound))
            } maximumValueLabel: {
                Text(String(format: "%+.0f", range.upperBound))
            }
            .padding([.top, .bottom])

            Text(String(format: "%.2f", value))
        }
    }
}

#Preview {
    ActionsSliderViewTimeInterval(title: "Preview", value: .constant(42))
}

