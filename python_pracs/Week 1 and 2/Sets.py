# Sets
# creating a set of integer type

integer_set = {1, 2, 3, 4, 5, 6, 7}
print("Integer set", integer_set)

string_set = {"a", "e", "e", "o", "u"}
print("String set", string_set)

mixed_set = {1, 2, "hello", 4, 5, "hi", 7}
print("String set", mixed_set)


# creating an empty set

empty_dict = {}  # this creates an empty dictionary
print(type(empty_dict))

empty_set = set()
print(type(empty_set))

# duplicate items in a set

numbers = {1, 5, 6, 2, 4, 3, 8, 3, 9, 8, 6, 6}
print("Numbers", numbers)

# Adding elements to a set

numbers.add(22)
numbers.add(12)
numbers.add(24)
print("New set of numbers", numbers)


# Updating a set using update()
initial_set = {"apple", "banana"}
print("Initial set:", initial_set)

y = ["apple", "pawpaw", " orange"]

initial_set.update(y)
print("Updated set", initial_set)

# Removing element using discard()
initial_set.discard("banana")
print("Set after discard():", initial_set)

# Iterating through a set

for i in initial_set:
    print(i)

# FInding the length, number of items

print("Length", len(initial_set))

# Python set operations
# Union => A | B The union of A and B is the set of elements which are in A, in B, or in both
# we use the | operator or the union() fxn to perform union operation
# Example
A = {1, 2, 3, 4, 5}
B = {4, 5, 6, 7, 8}
print("Union of A and B using | operator", A | B) #Output: {1, 2, 3, 4, 5, 6, 7, 8}
print("Union of A and B using union()", A.union(B)) #Output: {1, 2, 3, 4, 5, 6, 7, 8}

# Intersection => A & B The intersection of A and B is the set of elements which are in both A and B 
# we use the & operator or the intersection() fxn to perform intersection operation
# Example
print("Intersection of A and B using & operator", A & B) #Output: {4, 5}
print("Intersection of A and B using intersection()", A.intersection(B)) #Output: {4, 5}

# Difference => A - B The difference of A and B is the set of elements that are only in A but not in B
# we use the - operator or the difference() fxn to perform difference operation
# Example
print("Difference of A and B using - operator", A - B) #Output: {1, 2, 3}
print("Difference of A and B using difference()", A.difference(B)) #Output: {1, 2, 3}

# Symmetric Difference => A ^ B The symmetric difference of A and B is the set of elements which are in either of the sets and not in both
# we use the ^ operator or the symmetric_difference() fxn to perform symmetric difference operation
# Example
print("Symmetric difference of A and B using ^ operator", A ^ B) #Output: {1, 2, 3, 6, 7, 8}
print("Symmetric difference of A and B using symmetric_difference()", A.symmetric_difference(B)) #Output: {1, 2, 3, 6, 7, 8}

# Subset => A <= B A is said to be the subset of B if all elements of A are in B
# we use the <= operator or the issubset() fxn to check if A is a subset of B
# Example
X = {4, 5}
print("Is A a subset of B using <= operator", X <= A) #Output: True
print("Is A a subset of B using issubset()", X.issubset(A)) #Output: True

# Superset => A >= B A is said to be the superset of B if all elements of B are in A
# we use the >= operator or the issuperset() fxn to check if A is a superset of B
# Example
print("Is A a superset of B using >= operator", A >= X) #Output: True
print("Is A a superset of B using issuperset()", A.issuperset(X)) #Output: True

# Disjoint => A.isdisjoint(B) A and B are said to be disjoint if they have no common elements
# we use the isdisjoint() fxn to check if A and B are disjoint
# Example
Y = {1, 2}
print("Are A and B disjoint?", A.isdisjoint(Y)) #Output: False
print("Are A and B disjoint?", A.isdisjoint(B)) #Output: False
print("Are A and B disjoint?", X.isdisjoint(Y)) #Output: False
print("Are A and B disjoint?", X.isdisjoint(B)) #Output: True
print("Are A and B disjoint?", A.isdisjoint(B)) #Output: False

# checking if two sets are equal
# Example
print("Are A and B equal?", A == B) #Output: False
print("Are A and B equal?", A == X) #Output: False
print("Are A and B equal?", A == A) #Output: True
print("Are A and B equal?", A == {1, 2, 3, 4, 5}) #Output: True
print("Are A and B equal?", A == {1, 2, 3, 4, 5, 6}) #Output
