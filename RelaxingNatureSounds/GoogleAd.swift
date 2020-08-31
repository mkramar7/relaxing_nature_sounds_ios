//
//  GoogleAd.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 31/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct GoogleAdBanner: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<GoogleAdBanner>) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        // banner.adUnitID = "ca-app-pub-2155607165715644/1922843841" // Real banner ID
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716" // Sample banner ID
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<GoogleAdBanner>) {
        
    }
    
}
