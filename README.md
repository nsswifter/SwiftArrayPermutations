# <img src="https://github.com/devicons/devicon/blob/master/icons/swift/swift-original.svg" width="40" height="40"/>&nbsp; Array Permutations

These two code snippets provide additional functionality to the Array type for generating `permutations` of its elements.

- [Usage](#usage)
- [Method 1](#method-1)
- [Method 2](#method-2)
- [Note](#note)
- [Contributors](#contributors)
- [License](#license)

## Usage
To generate permutations of an array, call the `permutations()` function on the array.
```swift 
> let myArray = [1, 2, 3]
> let permutations = myArray.permutations()
> print(permutations)

[[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
```

## Method 1

The [First Method](PermutationsSourceCode/method1.swift) uses a recursive algorithm to generate all permutations of the elements in the array. It splits the array into its first element and the remaining elements and recursively generates permutations of the remaining elements. For each permutation, it inserts the first element in all possible positions and appends the result to the final array.

```swift
extension Array {
    func permutations() -> [[Element]] {
        guard let (firstElement, remainingElements) = splitHeadAndTail() else { return [[]] }
        var results = [[firstElement]]
        for element in remainingElements {
            results = results.flatMap { $0.insertElementBetween(element) }
        }
        return results
    }
}
```

## Method 2

The [Second Method](PermutationsSourceCode/method2.swift) also generates all permutations of the elements in the array, but uses a slightly different approach. It uses a recursive algorithm to remove one element from the array at a time, generates permutations of the remaining elements, and then inserts the removed element at the beginning of each permutation.

```swift
extension Array {
    func permutations() -> [[Element]] {
        if count == 1 { return [[first!]] }
        var result: [[Element]] = []
        for (index, element) in enumerated() {
            var subArray = self
            subArray.remove(at: index)
            let subPermutations = subArray.permutations()
            for var subResult in subPermutations {
                subResult.insert(element, at: 0)
                result.append(subResult)
            }
        }
        return result
    }
}
```

## Note

Both methods generate all possible permutations of the elements in the array. However, the first method may be faster for smaller arrays, while the second method may be more efficient for larger arrays. It is recommended to test both methods and choose the one that performs better for your specific use case.

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

`Swift Array Permutations` is released under an MIT license. See [LICENSE](LICENSE) for more information.
