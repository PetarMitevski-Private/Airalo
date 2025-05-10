import SwiftUI

struct PackageView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Card with gradient background
            RoundedRectangle(cornerRadius: 7)
                .fill(
                    LinearGradient(
                        colors: [Color.orange, Color.yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(.dropShadow)

            AsyncImage(url: URL(string: "https://cdn.airalo.com/images/9fba4c48-f9ad-4950-bf57-86c649c9a223.png")) { image in
                image
                    .resizable()
            } placeholder: {
                Color.orange
                    .rounded
            }
            .frame(width: 140, height: 88)
            .offset(x: -20, y: -20)
            .shadow(.dropShadow)


            // Card content
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Burj Mobile")
                        .font(.plexSansSemiBold19)
                        .foregroundColor(.white)
                    Text("United Arab Emirates")
                        .font(.plexSansSemiBold13)
                        .foregroundColor(.white)
                }
                .padding(20)

                
                Rectangle()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .opacity(0.3)

                HStack(spacing: 10) {
                    Image(.icData)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.white)
                    Text("DATA")
                        .font(.plexSansMedium12)
                        .foregroundColor(.white)
                    Spacer()
                    Text("1 GB")
                        .font(.plexSansMedium17)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .opacity(0.3)

                HStack(spacing: 10) {
                    Image(.icValidity)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.white)
                    Text("VALIDITY")
                        .font(.plexSansMedium12)
                        .foregroundColor(.white)
                    Spacer()
                    Text("7 Days")
                        .font(.plexSansMedium17)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .opacity(0.3)

                

                Button(action: {
                }) {
                    Text("US$8.50 - BUY NOW")
                        .font(.plexSansSemiBold13)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                .padding(20)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
