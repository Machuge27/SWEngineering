var1 = ("hello")
print(type(var1)) # Output: <class 'str'>

# To create a tuple with a single element, you need to include a comma after the element.
var2 = ("hello",)
print(type(var2)) # Output: <class 'tuple'>

# Parentheses are optional for tuples in Python but a good practice to have them.
var3 = "hello",
print(type(var3)) # Output: <class 'tuple'>


#Accessing elements in a tuple
# You can access elements in a tuple using an index.

letters = ('a', 'b', 'c', 'd', 'e')
print(letters[0]) # Output: a
print(letters[2]) # Output: c

#Nested tuple
# A tuple can contain another tuple as well as other more complex data types. this is how to access elements in a nested tuple.
print("Nested tuple")
nested_tuple = ('Hello', 1, 2.0, ('World', 3, 4.0))
print(nested_tuple[3]) # Output: ('World', 3, 4.0)
print(nested_tuple[3][0]) # Output: World
print(nested_tuple[3][0][2]) # Output: r

#A mixed data type tuple
# A tuple can contain different types of data types.
print("Mixed data type tuple")
mixed_tuple = (1, 2.0, 'hello', [1, 2, 3], (4, 5, 6))
print(mixed_tuple) # Output: (1, 2.0, 'hello', [1, 2, 3], (4, 5, 6))
accessing_elements = mixed_tuple[3][2]
print(accessing_elements) # Output: [1, 2, 3]
print(mixed_tuple[3][2]) # Output: 3

#Slicing
# You can slice a tuple the same way you slice a list.
print("Slicing")
print(letters[2:4]) # Output: ('c', 'd')

#negative indexing
# You can access a tuple element using negative indexing.
print("Negative indexing")
print(letters[-1]) # Output: e
print(letters[-4]) # Output: b

#Concatenation
# You can concatenate tuples using the + operator.
print("Concatenation")
print(letters + nested_tuple) # Output: ('a', 'b', 'c', 'd', 'e', 'Hello', 1, 2.0, ('World', 3, 4.0))

#Repetition
# You can repeat a tuple using the * operator.
print("Repetition")
print(letters * 2) # Output: ('a', 'b', 'c', 'd', 'e', 'a', 'b', 'c', 'd', 'e')

#Membership test
# You can check if an item exists in a tuple or not, using the in keyword.
print("Membership test")
print('a' in letters) # Output: True

# Methods in tuple
# count() - Returns the number of occurrences of a value.
# index() - Returns the index of a value.
print("Methods in tuple")
print(letters.count('a')) # Output: 1
print(letters.index('a')) # Output: 0

# Tuple unpacking
# You can unpack a tuple by assigning it to a comma-separated list of variables.
print("Tuple unpacking")
tup = ('Hello', 'World')
a, b = tup
print(a) # Output: Hello
print(b) # Output: World

# Tuple packing
# You can pack a sequence of values into a tuple without using parentheses.
print("Tuple packing")
tup = 3, 4.6, "dog"
print(tup) # Output: (3, 4.6, 'dog')

# Tuple comparison
# Tuples are compared position by position: the first item of the first tuple is compared to the first item of the second tuple; if they are not equal, this is the result of the comparison, else the second item is considered, then the third and so on.

# If two tuples have the same length, the comparison ends when the elements of the two tuples at the same index are different.
# If two tuples have different lengths, the tuple with the fewest elements is the smaller one. If the smaller tuple is identical to the beginning of the longer tuple, the longer tuple is considered greater.
print("Tuple comparison")
print((0, 1, 2) < (0, 3, 4)) # Output: True
print((0, 1, 2000000) < (0, 3, 4)) # Output: True
print((0, 1, 2) < (0, 1, 2000000)) # Output: True
print((0, 1, 2) < (0, 1, 2, 3)) # Output: True
print((0, 1, 2) < (0, 1)) # Output: False
print((0, 1, 2) < (0, 1, 2)) # Output False
