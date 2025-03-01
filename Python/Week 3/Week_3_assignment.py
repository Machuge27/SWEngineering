# Create a function named calculate_discount(price, discount_percent) that calculates the final price after applying a discount. 
# The function should take the original price (price) and the discount percentage (discount_percent) as parameters. 
# If the discount is 20% or higher, apply the discount; otherwise, return the original price.
# Using the calculate_discount function, prompt the user to enter the original price of an item and the discount percentage. 
# Print the final price after applying the discount, or if no discount was applied, print the original price.

def calculate_discount(price, discount_percent):
    """
    Calculate the final price after applying a discount.
    
    Args:
    price (float): The original price of the item.
    discount_percent (float): The discount percentage.
    
    Returns:
    float: The final price after discount, or the original price if discount is less than 20%.
    """
    if discount_percent >= 20:
        # Calculate the discounted price
        discounted_price = price * (1 - discount_percent / 100)
        return round(discounted_price, 2)
    else:
        # Return the original price if discount is less than 20%
        return price

def main():
    try:
        # Get user input for original price
        original_price = float(input("Enter the original price of the item: "))
        
        # Get user input for discount percentage
        discount_percentage = float(input("Enter the discount percentage: "))
        
        # Calculate the final price
        final_price = calculate_discount(original_price, discount_percentage)
        
        # Print the result
        if final_price < original_price:
            print(f"Discounted price: ${final_price}")
        else:
            print(f"No discount applied. Original price: ${original_price}")
    
    except ValueError:
        print("Invalid input. Please enter numeric values for price and discount percentage.")

# Run the main function
if __name__ == "__main__":
    main()