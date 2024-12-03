"""
Weekly Code Challenge
Coding Challenges for basic control flows and functions
 
1. Large Power
Create a method that tests whether the result of taking the power of one number to another number provides an answer which is greater than 5000. We will use a conditional statement to return True if the result is greater than 5000 or return False if it is not. In order to accomplish this, we will need the following steps:

1.	Define the function to accept two input parameters called base and exponent
2.	Calculate the result of base to the power of exponent
3.	Use an if statement to test if the result is greater than 5000. If it is then return True. Otherwise, return False

Coding Question
Create a function named large_power() that takes two parameters named base and exponent.
If base raised to the exponent is greater than 5000, return True, otherwise return False

"""

def large_power(base, exponent):
    """
    Determines if base raised to the exponent is greater than 5000.
    
    Args:
    base (int): The base number
    exponent (int): The power to raise the base to
    
    Returns:
    bool: True if base^exponent > 5000, False otherwise
    """
    # Calculate base raised to the exponent
    result = base ** exponent
    
    # Check if the result is greater than 5000
    if result > 5000:
        return True
    else:
        return False

# Testing the function with some example cases
print(large_power(2, 10))  # Result False
print(large_power(5, 10))   # Result True


