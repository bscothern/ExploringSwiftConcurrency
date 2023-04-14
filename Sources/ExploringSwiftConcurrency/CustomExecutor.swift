import Foundation

final class CustomExecutor: SerialExecutor, @unchecked Sendable {
    let queue = DispatchQueue(label: "CustomExecutorQueue", qos: .userInitiated)

    func enqueue(_ job: UnownedJob) {
        queue.async {
            print("on CustomExecutorQueue")
            job._runSynchronously(on: self.asUnownedSerialExecutor())
        }
    }

    func asUnownedSerialExecutor() -> UnownedSerialExecutor {
        .init(ordinary: self)
    }
}
