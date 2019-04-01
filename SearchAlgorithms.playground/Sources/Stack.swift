public struct Stack<T> {
  
  fileprivate var list = LinkedList<T>()
  
  public init() {}
  
  public var isEmpty: Bool {
    return list.isEmpty
  }
  
  public mutating func push(_ element: T) {
    list.append(element)
  }
  
  public mutating func pop() -> T? {
    guard !list.isEmpty, let element = list.last else { return nil }
    
    _ = list.remove(element)
    
    return element.value
  }
  
  public func peek() -> T? {
    return list.last?.value
  }
}

extension Stack: CustomStringConvertible {
  public var description: String {
    return list.description
  }
}
