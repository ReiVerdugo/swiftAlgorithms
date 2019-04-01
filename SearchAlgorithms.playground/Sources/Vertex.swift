public class Vertex<T: Hashable> {
  public var visited = false
  var value = Double.greatestFiniteMagnitude
  let data: T
  
  init(data: T) {
    self.data = data
  }
}

extension Vertex: Hashable {
  public var hashValue: Int {
    return "\(data)".hashValue
  }
  
  static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.data == rhs.data
  }
}

extension Vertex: CustomStringConvertible {
  public var description: String {
    return "\(data)"
  }
}
