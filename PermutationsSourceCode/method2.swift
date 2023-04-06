/// Provides additional functionality to the Array type for generating permutation.
///
/// Usage: `array.permutations()`
extension Array {
    /// Returns all permutations of the elements in the array.
    ///
    /// - Returns: An array of arrays, where each array is a permutation of the original array's
    ///   elements.
    func permutations() -> [[Element]] {
        // Base case: if the array has only one element,
        // return a nested array containing that element
        if count == 1 { return [[first!]] }
        
        // Initialize an empty array to store the permutations
        var result: [[Element]] = []

        // Iterate over the elements in the array
        for (index, element) in enumerated() {
            // Create a new array by removing the current element from the original array
            var subArray = self
            subArray.remove(at: index)

            // Recursively generate permutations of the new array
            let subPermutations = subArray.permutations()
            
            // For each permutation, insert the current element at the beginning
            // and append the result to the result array
            for var subResult in subPermutations {
                subResult.insert(element, at: 0)
                result.append(subResult)
            }
        }
        // Return the result array containing all permutations
        return result
    }
}
