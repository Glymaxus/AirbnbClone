//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by bastien giat on 24/10/2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(showDestinationSearchView: $showDestinationSearchView)
            } else {
                VStack {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(0...10, id: \.self) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView()
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                    }
                    
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
