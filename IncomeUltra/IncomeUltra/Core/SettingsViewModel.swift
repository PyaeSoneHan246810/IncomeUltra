//
//  SettingsViewModel.swift
//  IncomeUltra
//
//  Created by Dylan on 23/8/25.
//

import Observation
import Factory

@MainActor
@Observable
final class SettingsViewModel {
    @ObservationIgnored @Injected(\.appInfoStore) private var appInfoStore
    private var appName: String {
        appInfoStore.name
    }
    private var appDescription: String {
        appInfoStore.description
    }
    var appIntroData: IntroBoxView.Data {
        .init(
            title: appName,
            sfSymbol: "info.circle",
            imageName: "AppIconImage",
            description: appDescription
        )
    }
    private var appDeveloper: String {
        appInfoStore.developer
    }
    private var appVersion: String {
        appInfoStore.version
    }
    private var appCompatibility: String {
        appInfoStore.compatibility
    }
    private var appWebsite: String {
        appInfoStore.website
    }
    private var appAgreements: AppInfoLiveStore.Agreements {
        appInfoStore.agreements
    }
    var appInfoData: InfoBoxView.Data {
        .init(
            title: "Application",
            sfSymbol: "apps.iphone",
            infoItems: [
                .init(title: "Developer", description: appDeveloper),
                .init(title: "Version", description: appVersion),
                .init(title: "Compatibility", description: appCompatibility),
                .init(title: "Website", urlString: appWebsite)
            ]
        )
    }
    var agreementInfoData: InfoBoxView.Data {
        .init(
            title: "Agreements",
            sfSymbol: "apps.iphone",
            infoItems: [
                .init(title: "Privacy Policy",  urlString: appAgreements.privacyPolicyUrl),
                .init(title: "Terms and Conditions",  urlString: appAgreements.termsAndConditionsUrl),
                .init(title: "Copyright Policy",  urlString: appAgreements.copyrightPolicyUrl),
                .init(title: "Disclaimer",  urlString: appAgreements.disclaimerUrl)
            ]
        )
    }
}
