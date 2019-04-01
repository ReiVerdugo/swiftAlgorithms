import UIKit
import XCPlayground

let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

let route = adjacencyList.dijkstra(source: singapore, destination: austinTexas)
for edge in route {
  print("\(edge.source) -> \(edge.destination): \(edge.weight!)")
}

//let dungeon = AdjacencyList<String>()
//
//let entranceRoom = dungeon.createVertex(data: "Entrance")
//let spiderRoom = dungeon.createVertex(data: "Spider")
//let goblinRoom = dungeon.createVertex(data: "Goblin")
//let ratRoom = dungeon.createVertex(data: "Rat")
//let knightRoom = dungeon.createVertex(data: "Knight")
//let batRoom = dungeon.createVertex(data: "Bat")
//let orcRoom = dungeon.createVertex(data: "Orc")
//let keyRoom = dungeon.createVertex(data: "Key")
//let treasureRoom = dungeon.createVertex(data: "Treasure")

//dungeon.add(.undirected, from: entranceRoom, to: spiderRoom, weight: 1)
//dungeon.add(.undirected, from: entranceRoom, to: ratRoom, weight: 1)
//dungeon.add(.undirected, from: entranceRoom, to: batRoom, weight: 1)
//dungeon.add(.undirected, from: spiderRoom, to: goblinRoom, weight: 1)
//dungeon.add(.undirected, from: spiderRoom, to: orcRoom, weight: 1)
//dungeon.add(.undirected, from: ratRoom, to: treasureRoom, weight: 1)
//dungeon.add(.undirected, from: ratRoom, to: keyRoom, weight: 1)
//dungeon.add(.undirected, from: batRoom, to: knightRoom, weight: 1)

//print(dungeon.description)
//if let edges = dungeon.bfs(from: entranceRoom, to: treasureRoom) {
//
//  for edge in edges {
//    print("\(edge.source) -> \(edge.destination)")
//  }
//}

//var visits = Set<Vertex<String>>()
//if let nodes = dungeon.recursiveDfs(vertex: entranceRoom, destination: knightRoom) {
//  print(nodes)
//}

//if let edges = dungeon.dfs(from: entranceRoom, to: knightRoom) {
//  for edge in edges {
//    print("\(edge.source) -> \(edge.destination)")
//  }
//}




