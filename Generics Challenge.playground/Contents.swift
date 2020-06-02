import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Element
    
    private (set) var dict = [Element : Int]()
    
    var count: Any {
        return (dict.count > 0 ? dict.count : dict.isEmpty)
    }
    
    mutating func insert(_ element: Element) {
        if let _ = dict[element] {
            dict[element]! += 1
        } else {
            dict[element] = 0
        }
    }
    
    mutating func remove(_ element: Element) {
        if let _ = dict[element] {
            dict[element]! -= 1
        } else {
            dict.removeValue(forKey: element)
        }
    }
    
    subscript(_ member: Element) -> Int {
        if let _ = dict[member] {
            return dict[member]!
        }
        return 0
    }
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
