

import Foundation
import ReactiveCocoa
import ReactiveSwift


func RACObserve(target: NSObject!, keyPath: String) -> SignalProducer<Any?, Never> {
    return target.reactive.producer(forKeyPath: keyPath )
}

 
