//
//  Configuration.swift
//  event-manager-ios
//
//  Created by Career Mode on 2017. 10. 01..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import UIKit

struct Configuration {
	lazy var environment: Environment = {
		if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
			if configuration.range(of: "Debug Mock") != nil {
				return Environment.mock
			} else if configuration.range(of: "Debug Staging") != nil {
				return Environment.staging
			}
		}
		return Environment.release
	}()
}

enum Environment: String {
	case mock
	case staging
	case release

	var baseURL: String {
		switch self {
		case .mock: return "http://s29pda6cgdg2lubuf-mock.stoplight-proxy.io/api"
		case .staging: return "https://us-central1-event-manager-1400e.cloudfunctions.net"
		case .release: return ""
		}
	}
}
