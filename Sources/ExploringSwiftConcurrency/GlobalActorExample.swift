import Foundation

@main
public final class GlobalActorExample {
    static var count = 0

    public init() {}

    @CustomActor
    func doSomethingOnCustomActor() async {
        GlobalActorExample.count += 1
        print(#function, GlobalActorExample.count)
    }

    @CustomActor
    func doSomethingAndSleep() async throws {
        try await Task.sleep(for: .seconds(2))
        await Task.yield()
        print(#function)
    }

    @CustomActor
    func doSomethingFirst() async {
        print(#function)
    }

    @CustomActor
    func spin(for duration: TimeInterval) {
        let end = Date.now.addingTimeInterval(duration)
        var i = 0
        while Date.now < end {
            i += 1
            if i.isMultiple(of: 1_000_000) {
                print(i / 1_000_000)
            }
        }
        print(#function)
    }

    @MainActor
    static func main() async throws {
        let example1 = GlobalActorExample()
        let example2 = GlobalActorExample()
        await example1.doSomethingOnCustomActor()

        async let a: Void = try example1.doSomethingAndSleep()
        await example1.doSomethingFirst()
        _ = try await a

        async let b: Void = await example1.spin(for: 2)
        try await Task.sleep(for: .seconds(1))
        print("awake")
        await example2.doSomethingOnCustomActor()
        _ = await b
        print("done")
    }
}
