import numpy as np

#defining a simple numpy array
def simple_array():
    arr = np.array([1, 2, 3, 4, 5])
    print("Array: ", arr)
    print("Array type: ", type(arr))

#defining a 2D array
def basic_2D_array():
    arr = np.array([[1, 2, 3], [4, 5, 6]])
    print("2D Array: \n", arr)

def operations():
    a = np.array([1, 2, 3, 4])
    b = np.array([5, 6, 7, 8])
    
    #addition
    print("Addition: ", a+b)
    
    #subtraction
    print("Subtraction: ", a-b)
    
    #multiplication
    print("Multiplication: ", a*b)
    
    #division
    print("Division: ", a/b)
    
    #dot product
    print("Dot product: ", np.dot(a, b))
    
    #sum of all elements
    print("Sum of all elements: ", np.sum(a))
    
    #mean of all elements
    print("Mean of all elements: ", np.mean(a))
    
    #standard deviation of all elements
    print("Standard deviation of all elements: ", np.std(a))
    
    #minimum element
    print("Minimum element: ", np.min(a))
    
    #maximum element
    print("Maximum element: ", np.max(a))
    
    #index of minimum element
    print("Index of minimum element: ", np.argmin(a))
    
    #index of maximum element
    print("Index of maximum element: ", np.argmax(a))
    
    #transpose of a matrix
    a = np.array([[1, 2, 3], [4, 5, 6]])
    print("Transpose of a matrix: \n", a.T)
    
    #reshaping a matrix
    a = np.array([[1, 2, 3], [4, 5, 6]])
    print("Reshaping a matrix: \n", a.reshape(3, 2))
    
    #flattening a matrix
    a = np.array([[1, 2, 3], [4, 5, 6]])
    print("Flattening a matrix: ", a.flatten())
    
    #slicing and indexing
    a = np.array([[1, 2, 3], [4, 5, 6]])
    print("Slicing and indexing: ", a[0, 1])
    
    #concatenation
    a = np.array([1, 2, 3])
    b = np.array([4, 5, 6])
    print("Concatenation: ", np.concatenate((a, b)))
    
    #stacking
    a = np.array([1, 2, 3])
    b = np.array([4, 5, 6])
    print("Stacking: ", np.stack((a, b)))
    
    #splitting
    a = np.array([1, 2, 3, 4, 5, 6])
    print("Splitting: ", np.split(a, 2))
    
    #sorting
    a = np.array([3, 2, 1, 5, 4])
    print("Sorting: ", np.sort(a))
    
    #filtering
    a = np.array([1, 2, 3, 4, 5])
    print("Filtering: ", a[a>2])
    
    #random numbers
    a = np.random.rand(5)
    print("Random numbers: ", a)
    
    #random numbers with seed
    np.random.seed(0)
    a = np.random.rand(5)
    print("Random numbers with seed: ", a)
    
    #random integers
    a = np.random.randint(1, 10, 5)
    print("Random integers: ", a)
    
    #random integers with seed
    np.random.seed(0)
    a = np.random.randint(1, 10, 5)
    print("Random integers with seed: ", a)
    
if __name__ == "__main__":
    simple_array()
    basic_2D_array()   
    operations()