//
//  ImageLoaderView.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import SwiftUI

struct ImageLoaderView: View {
  @Binding var urlString: String
  var blurRadius: CGFloat = 0
  
  var body: some View {
    AsyncImage(url: URL(string: urlString)) { phase in
      switch phase {
        case .failure:
          Image(systemName: Constants.imagePlaceholderName)
            .font(.largeTitle)
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .blur(radius: blurRadius)
        default:
          ProgressView()
      }
    }
  }
}

#Preview {
  ImageLoaderView(
    urlString: .constant(Constants.previewImageUrl),
    blurRadius: 3
  )
  .frame(width: 256, height: 256)
  .clipShape(.rect(cornerRadius: 25))
}
