# Function to divide multiple numbers
def div(*args):
    result = args[0]
    # Iterates through all arguments starting from the second one and divides the result by them
    for i in args[1:]:
        result /= i
    return result