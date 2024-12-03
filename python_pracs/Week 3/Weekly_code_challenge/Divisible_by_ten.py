"""
Weekly Code Challenge
Coding Challenges for basic control flows and functions
 
2.Divisible By Ten
Create a function that determines whether or not a number is divisible by ten. A number is divisible by ten if the remainder of the number divided by 10 is 0. Using this, we can complete this function in a few steps:

1.	Define the function header to accept one input num
2.	Calculate the remainder of the input divided by 10 (use modulus)
3.	Use an if statement to check if the remainder was 0. If the remainder was 0, return True, otherwise, return False
 
Coding question
Create a function called divisible_by_ten() that has one parameter named num.
The function should return True if num is divisible by 10, and False otherwise. Consider using modulo operator % to check for divisibility.


"""

def divisible_by_ten(num):
    """
    Checks if the given number is divisible by 10.
    
    Args:
    num (int): The number to check for divisibility
    
    Returns:
    bool: True if num is divisible by 10, False otherwise
    """
    # Check if remainder of num divided by 10 is 0
    if num % 10 == 0:
        return True
    else:
        return False

# Test the function with some example cases
print(divisible_by_ten(20))   # Should return True
print(divisible_by_ten(25))   # Should return False
print(divisible_by_ten(30))   # Should return True
print(divisible_by_ten(7))    # Should return False


