import SwiftUI
import AiraloUIFoundations

struct ErrorView: View {
    private let message: String
    private let onRetry: () -> Void
    
    init(message: String = .staticMessage,
         onRetry: @escaping () -> Void) {
        self.message = message
        self.onRetry = onRetry
    }
    
    var body: some View {
        VStack(spacing: .spacing20) {
            HStack {
                emptyIcon
                filledIcon
                emptyIcon
            }
            
            Text(message)
                .textStyle(textStyle: .bodyStyle)
                .multilineTextAlignment(.center)
                .padding(.horizontal, .spacing20)
            
            Button(action: onRetry) {
                Text(verbatim: .buttonTitle.uppercased())
                    .font(.plexSansSemiBold13)
                    .padding(.vertical, .spacing12)
                    .foregroundColor(.charcoal)
                    .padding(.horizontal, .spacing40)
                    .overlay(
                        RoundedRectangle(cornerRadius: .spacing7)
                            .stroke(AiraloColor.charcoal, lineWidth: 1)
                    )
                
            }
        }
        .background(Color.alabasterWhite)
        .padding(.horizontal, .spacing20)
    }
    
    private var emptyIcon: some View {
        Image(systemName: "x.square")
            .resizable()
            .scaledToFit()
            .frame(width: .emptyIconSideSize, height: .emptyIconSideSize)
            .foregroundColor(.charcoal)
    }
    
    private var filledIcon: some View {
        Image(systemName: "x.square.fill")
            .resizable()
            .scaledToFit()
            .frame(width: .filledIconSideSize, height: .filledIconSideSize)
            .foregroundColor(.charcoal)
    }
}

private extension CGFloat {
    static let emptyIconSideSize: CGFloat = 30
    static let filledIconSideSize: CGFloat = 50
}

private extension String {
    static let staticMessage: String = "Something went wrong,\n Try again!"
    static let buttonTitle: String = "Refresh"
}

#Preview {
    ErrorView(onRetry: { })
}
