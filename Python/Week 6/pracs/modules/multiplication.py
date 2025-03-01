# Function to multiply multiple numbers
def multiply(*args):
    result = 1
    # Iterates through all arguments and multiplies them
    for i in args:
        result *= i
    return result