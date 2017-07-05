
public protocol Value {
    func push(_ vm: VirtualMachine)
    func kind() -> Kind
    static func arg(_ vm: VirtualMachine, value: Value) -> String?
}

open class StoredValue: Value, Equatable {
    
    fileprivate let registryLocation: Int
    internal weak var vm: VirtualMachine?
    
    internal init(_ vm: VirtualMachine?) {
        self.vm = vm
        if let vm = self.vm {
            vm.pushFromStack(-1)
            registryLocation = vm.ref(RegistryIndex)
        } else {
            registryLocation = -1
        }
    }
    
    deinit {
        vm?.unref(RegistryIndex, registryLocation)
    }

    public var length: Int {
        guard let vm = self.vm else { return 0 }
        push(vm)
        let len = vm.len(-1)
        vm.pop()
        return len
    }

    open func push(_ vm: VirtualMachine) {
        vm.rawGet(tablePosition: RegistryIndex, index: registryLocation)
    }
    
    open func kind() -> Kind {
        fatalError("Override kind()")
    }
    
    open class func arg(_ vm: VirtualMachine, value: Value) -> String? {
        fatalError("Override arg()")
    }
    
}

public func ==(lhs: StoredValue, rhs: StoredValue) -> Bool {

    guard let lhsVM = lhs.vm, let rhsVM = rhs.vm else { return  false }
    if lhsVM.vm != rhsVM.vm { return false }
    
    lhs.push(lhsVM)
    lhs.push(rhsVM)
    let result = lua_compare(lhsVM.vm, -2, -1, LUA_OPEQ) == 1
    lhsVM.pop(2)
    
    return result
}
