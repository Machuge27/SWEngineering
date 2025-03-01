# Function to subtract multiple numbers
def subtract(*args):
    result = args[0]
    # Iterates through all arguments starting from the second one and subtracts them from the result
    for i in args[1:]:
        result -= i
    return result