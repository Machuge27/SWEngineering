def calculate(num1, num2, operation):
    """Perform the specified mathematical operation."""
    if operation == '+':
        return num1 + num2
    elif operation == '-':
        return num1 - num2
    elif operation == '*':
        return num1 * num2
    elif operation == '/':
        if num2 == 0:
            return "Error: Division by zero"
        return num1 / num2
    else:
        return "Error: Invalid operation"

def main():
    try:
        #collecting the user inputs, operands and operator
        num1 = float(input("Enter the first number: "))
        num2 = float(input("Enter the second number: "))
        operation = input("Enter the operation (+, -, *, /): ")

        #calling the calculate function to perform the operation
        result = calculate(num1, num2, operation)
        #Then we print out the result. 👌
        print(f"{num1} {operation} {num2} = {result}")

    except ValueError:
        print("Error: Please enter valid numbers")

if __name__ == "__main__":
    main()