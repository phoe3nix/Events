// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
@testable import Events
#elseif os(OSX)
import AppKit
#endif

// swiftlint:disable all













class ABCMock: ABC {

    //MARK: - avdddda

    var avddddaCallsCount = 0
    var avddddaCalled: Bool {
        return avddddaCallsCount > 0
    }
    var avddddaClosure: (() -> Void)?

    func avdddda() {
        avddddaCallsCount += 1
        avddddaClosure?()
    }

    //MARK: - addd

    var adddCallsCount = 0
    var adddCalled: Bool {
        return adddCallsCount > 0
    }
    var adddClosure: (() -> Void)?

    func addd() {
        adddCallsCount += 1
        adddClosure?()
    }

}
