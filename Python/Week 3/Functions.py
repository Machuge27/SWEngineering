# Function definition
def greet(name):
    """Greet a person by their name."""
    return f"Hello, {name}!"

# Function call
print(greet("Alice"))  # Output: Hello, Alice!


# Key Components of a Function
# Function Name: Should be descriptive and follow naming conventions.
# Parameters: Variables passed into the function.
# Docstring: An optional description of what the function does.
# Return Statement: Outputs a value from the function (optional).

# Parameters and Arguments

# Functions can accept zero or more arguments.

# 1. Positional Arguments:

def add(a, b):
    return a + b

print(add(3, 5))  # Output: 8

# 2. Default Arguments:

def greet(name="Guest"):
    return f"Hello, {name}!"

print(greet())  # Output: Hello, Guest!
print(greet("Alice"))  # Output: Hello, Alice!

# 3. Keyword Arguments:

def introduce(name, age):
    return f"My name is {name}, and I'm {age} years old."

print(introduce(age=25, name="Bob"))  # Output: My name is Bob, and I'm 25 years old.

# Anonymous Functions: Lambda

# Python supports anonymous functions using the lambda keyword. They are useful for short, simple functions.

# Lambda function for adding two numbers
add = lambda x, y: x + y
print(add(3, 5))  # Output: 8

# Using lambda with map()
numbers = [x for x in range(1, 10) if x % 2 == 0]
squares = list(map(lambda x: x**2, numbers))
print(squares)  # Output: [1, 4, 9, 16]



