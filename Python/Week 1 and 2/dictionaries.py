# A dictionary of cities and their population
cities = {
    "New York": 8175133,
    "Los Angeles": 3792621,
    "Chicago": 2695598,
    "Houston": 2100263,
    "Philadelphia": 1526006,
}
print(cities)

# Adding a new city
cities["Phoenix"] = 1445632
print("Updated cities:", cities)

# Changing the population of a city
cities["Philadelphia"] = 1567810
print("Updated cities:", cities)

# Accessing elements in a dictionary
# You can access the value of a key using square brackets.
print("Accessing elements in a dictionary")
print(cities["Los Angeles"])  # Output: 3792621

# Nested dictionary
# A dictionary can contain another dictionary as well as other more complex data types.
print("Nested dictionary")
nested_dict = {"first": {"a": 1}, "second": {"b": 2}}
print(nested_dict["first"])  # Output: {'a': 1}
print(nested_dict["first"]["a"])  # Output: 1

# Dictionary comprehension
# Dictionary comprehension is an elegant and concise way to create dictionaries.
print("Dictionary comprehension")
squares = {x: x * x for x in range(6)}
print(squares)

# Dictionary methods
# get() - Returns the value of a key.
# items() - Returns a list of key-value pairs.
# keys() - Returns a list of keys.
# pop() - Removes a key and returns the value.
# popitem() - Removes the last key-value pair added.
# values() - Returns a list of values.
print("Dictionary methods")
print(cities.get("Los Angeles"))  # Output: 3792621
print(
    cities.items()
)  # Output: dict_items([('Los Angeles', 3792621), ('Chicago', 2695598), ('Houston', 2100263), ('Philadelphia', 1526006), ('Phoenix', 1445632)])
print(
    cities.keys()
)  # Output: dict_keys(['Los Angeles', 'Chicago', 'Houston', 'Philadelphia', 'Phoenix'])
print(cities.pop("Chicago"))  # Output: 2695598
print(cities.popitem())  # Output: ('Phoenix', 1445632)
print(cities.values())  # Output: dict_values([3792621, 2100263, 1526006])
print(cities)

# operations on dictionary
# del fxn
del cities["New York"]
print("Del", cities)

# copy fxn
cities_copy = cities.copy()
print("Copy", cities_copy)

#any fxn returns True if any key of the dictionary is True
print("Any", any(cities)) #Output: True

#all fxn returns True if all keys of the dictionary are True
print("All", all(cities)) #Output: True

#len fxn returns the number of items in the dictionary
print("Len", len(cities)) #Output: 3

# clear fxn, Please have this at the bottom of the code as it will clear the dictionary.
cities.clear()
print("Clear", cities)
