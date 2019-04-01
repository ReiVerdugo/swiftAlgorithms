import Foundation

public enum EdgeType {
  case directed, undirected
}

public class Edge<T: Hashable> {
  public var source: Vertex<T>
  public var destination: Vertex<T>
  public let weight: Double?
  init(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
    self.source = source
    self.destination = destination
    self.weight = weight
  }
}

extension Edge: Hashable {
  public var hashValue: Int {
    return "\(source)\(destination)\(weight)".hashValue
  }
  
  static public func ==(lhs: Edge, rhs: Edge) -> Bool {
    return lhs.source == rhs.source &&
      lhs.destination == rhs.destination &&
      lhs.weight == rhs.weight
  }
}
