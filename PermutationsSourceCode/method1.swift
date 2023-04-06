/// Provides additional functionality to the Array type for generating permutation.
///
/// Usage: `array.permutations()`
extension Array {
    /// Splits the array into its first element and the remaining elements.
    ///
    /// - Returns: A tuple containing the first element and an array with the remaining elements,
    ///   or `nil` if the array is empty.
    func splitHeadAndTail() -> (firstElement: Element, remainingElements: [Element])? {
        guard let firstElement = first else { return nil }
        return (firstElement, Array(self.dropFirst()))
    }
    
    /// Inserts an element between all adjacent pairs of elements in the array.
    ///
    /// - Parameter element: The element to insert between adjacent pairs of elements.
    ///
    /// - Returns: An array of arrays, where each array is the original array with the element
    ///   inserted between two adjacent elements.
    func insertElementBetween(_ element: Element) -> [[Element]] {
        guard let (firstElement, remainingElements) = splitHeadAndTail() else { return [[element]] }
        return [[element] + self] + remainingElements.insertElementBetween(element).map { [firstElement] + $0 }
    }
    
    /// Returns all permutations of the elements in the array.
    ///
    /// - Returns: An array of arrays, where each array is a permutation of the original array's
    ///   elements.
    func permutations() -> [[Element]] {
        guard let (firstElement, remainingElements) = splitHeadAndTail() else { return [[]] }
        var results = [[firstElement]]
        for element in remainingElements {
            results = results.flatMap { $0.insertElementBetween(element) }
        }
        return results
    }
}
