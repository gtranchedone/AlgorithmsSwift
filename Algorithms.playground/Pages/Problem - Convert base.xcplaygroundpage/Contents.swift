/*:
[Previous](@previous)
# Search a maze
### Given a 2D array of black and white entries representing a maze with designated entry and exit points, find a path from the entrance to the exit, if one exists.
*/

func findPathFrom(entrance: MazePoint, to exit: MazePoint, var inMaze maze: [[MazeSpace]]) -> Stack<MazePoint>? {
    guard isPoint(entrance, inMaze: maze) else { return nil }
    guard isPoint(exit, inMaze: maze) else { return nil }
    var stack = Stack<MazePoint>()
    dfsPoint(exit, from: entrance, inMaze: &maze, path: &stack)
    return stack.isEmpty ? nil : stack
}

func dfsPoint(target: MazePoint, from point: MazePoint, inout inMaze maze: [[MazeSpace]], inout path: Stack<MazePoint>) -> Bool {
    guard maze[point.x][point.y] == .Path else { return false }
    maze[point.x][point.y] = .VisitedPath
    if point == target {
        path.push(point)
        return true
    }
    let adjacentPoints = adjacentPointsTo(point, inMaze: maze)
    for adj in adjacentPoints {
        if dfsPoint(target, from: adj, inMaze: &maze, path: &path) {
            path.push(adj)
            return true
        }
    }
    return false
}

func adjacentPointsTo(point: MazePoint, inMaze maze: [[MazeSpace]]) -> [MazePoint] {
    var points = [MazePoint]()
    let up = MazePoint(x: point.x, y: point.x - 1)
    if isPoint(up, inMaze: maze) { points.append(up) }
    let down = MazePoint(x: point.x, y: point.x + 1)
    if isPoint(down, inMaze: maze) { points.append(down) }
    let left = MazePoint(x: point.x - 1, y: point.x)
    if isPoint(left, inMaze: maze) { points.append(left) }
    let right = MazePoint(x: point.x + 1, y: point.x)
    if isPoint(right, inMaze: maze) { points.append(right) }
    return points
}

func isPoint(point: MazePoint, inMaze maze: [[MazeSpace]]) -> Bool {
    guard point.x >= 0 && point.x < maze.count else { return false }
    return point.y >= 0 && point.y < maze[point.x].count
}

enum MazeSpace {
    case Wall
    case Path
    case VisitedPath
}

struct MazePoint: Equatable {
    let x: Int, y: Int
}

func ==(lhs: MazePoint, rhs: MazePoint) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

//: [Next](@next)
