@propertyWrapper
struct Indirect<WrappedValue> {
    indirect enum _Indirect {
        case value(WrappedValue)

        var open: WrappedValue {
            switch self {
            case let .value(value):
                return value
            }
        }
    }

    private var value: _Indirect
    var wrappedValue: WrappedValue {
        get {
            value.open
        }
        set {
            value = .value(newValue)
        }
        _modify {
            defer { _fixLifetime(self) }
            var openedValue: WrappedValue!
            withUnsafeMutablePointer(to: &self.value) { valuePointer in
                openedValue = valuePointer.move().open
            }
            defer {
                withUnsafeMutablePointer(to: &self.value) { valuePointer in
                    valuePointer.initialize(to: .value(openedValue))
                }
            }
            yield &openedValue
        }
    }

    init(_ value: WrappedValue) {
        self.value = .value(value)
    }
}
