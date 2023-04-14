@globalActor
enum CustomActor {
    private actor _CustomActor: Actor {
        nonisolated let executor = CustomExecutor()

        nonisolated var unownedExecutor: UnownedSerialExecutor {
            executor.asUnownedSerialExecutor()
        }
    }

    public static let shared: some Actor = _CustomActor()
}
