// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct ActionsSliderViewCGFloat: View {
    @State private var range: ClosedRange<CGFloat>
    @State private var value: CGFloat = 0

    let title: String

    init(title: String, range: ClosedRange<CGFloat> = 0...1) {
        self.range = range
        self.title = title
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
    ActionsSliderViewCGFloat(title: "Preview")
}
