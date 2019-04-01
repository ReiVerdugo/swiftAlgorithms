import Foundation

public protocol Graphable {
  associatedtype Element: Hashable
  var description: CustomStringConvertible { get }
  
  func createVertex(data: Element) -> Vertex<Element>
  func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
  func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
  func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

enum Visit<Element: Hashable>  {
  case source
  case edge(Edge<Element>)
}

// Breadth First Search

extension Graphable {
  public func bfs(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
    var queue = Queue<Vertex<Element>>()
    var visits: [Vertex<Element> : Visit<Element>] = [source: .source]
    queue.enqueue(source)
    
    while let visitedVertex = queue.dequeue() {
      if visitedVertex == destination {
        var vertex = destination
        var route: [Edge<Element>] = []
        
        while let visit = visits[vertex],
          case .edge(let edge) = visit {
            
            route = [edge] + route
            vertex = edge.source
        }
        return route
      }
      
      let neighbourEdges = edges(from: visitedVertex) ?? []
      for edge in neighbourEdges {
        if visits[edge.destination] == nil {
          visits[edge.destination] = .edge(edge)
          queue.enqueue(edge.destination)
        }
      }
    }
    return nil
  }
}

// Deep First Search
extension Graphable {
  public func dfs(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
    var stack = Stack<Vertex<Element>>()
    var visits: [Vertex<Element> : Visit<Element>] = [source: .source]
    stack.push(source)
    while let visitedVertex = stack.pop() {
      if visitedVertex == destination {
        var vertex = destination
        var route: [Edge<Element>] = []
        
        while let visit = visits[vertex],
          case .edge(let edge) = visit {
            
            route = [edge] + route
            vertex = edge.source
        }
        return route
      }
      let neighbourEdges = edges(from: visitedVertex) ?? []
      for edge in neighbourEdges {
        if visits[edge.destination] == nil {
          visits[edge.destination] = .edge(edge)
          stack.push(edge.destination)
        }
      }
    }
    return nil
  }
  
  public func recursiveDfs(vertex: Vertex<Element>, destination: Vertex<Element>) -> [Vertex<Element>]? {
    var nodesVisited = [vertex]
    vertex.visited = true
    let neighbourEdges = edges(from: vertex) ?? []
    for edge in neighbourEdges {
      if edge.destination == destination {
        return nodesVisited + [edge.destination]
      }
      if !(edge.destination.visited) {
        let result = recursiveDfs(vertex: edge.destination, destination: destination)
        if let result = result {
          nodesVisited += result
        }
      }
    }
    return nodesVisited.count > 1 ? nodesVisited : nil
  }
  
  public func dijkstra(source: Vertex<Element>, destination: Vertex<Element>) -> [Edge<Element>] {
    source.value = 0
    var visits: [Vertex<Element> : Visit<Element>] = [source: .source]
    var priorityQueue: [Vertex<Element>] = []
    priorityQueue.append(source)
    while priorityQueue.first != nil {
      let visitedVertex = priorityQueue.remove(at: 0)
      // Return route
      if visitedVertex == destination {
        var vertex = destination
        var route: [Edge<Element>] = []
        
        while let visit = visits[vertex],
          case .edge(let edge) = visit {
            
            route = [edge] + route
            vertex = edge.source
        }
        return route
      }
      
      let neighbourEdges = edges(from: visitedVertex) ?? []
      for edge in neighbourEdges {
        let neighbordNode = edge.destination
        if !neighbordNode.visited && visitedVertex.value + edge.weight! < neighbordNode.value {
          neighbordNode.value = visitedVertex.value + edge.weight!
          visits[neighbordNode] = .edge(edge)
          priorityQueue.append(neighbordNode)
        }
      }
      visitedVertex.visited = true
      priorityQueue.sort(by: {$0.value < $1.value})
    }
    return []
  }
}


