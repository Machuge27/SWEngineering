# Example of a for loop
fruits = ["apple", "banana", "cherry"]

for fruit in fruits:
    print(f"I love {fruit}!")
    
# A for keyword indicates the start of a for loop.
# A <temporary variable> is used to represent the value of the element in the collection the loop is currently on.
# An in keyword separates the temporary variable from the collection used for iteration.
# A <collection> to loop over. In our examples, we will be using a list.
# An <action> to do anything on each iteration of the loop.    

# Example of a for loop with range
for number in range(1, 6):  # Loops from 1 to 5 (Inclusive, exclusive)
    print(f"Number: {number}")
    
# range(1, 6): Generates numbers starting from 1 up to (but not including) 6.
# Loop: The for loop iterates over each number in this range.
# Action: During each iteration, number represent the current value, and print outputs it.    

# Example of a while loop
count = 1

while count <= 5:
    print(f"Count: {count}")
    count += 1  # Increment the counter
    
# Initialization: count = 1 sets the starting value.
# Condition: while count <= 5 keeps the loop running as long as count is less than or equal to 5.
# Action: Inside the loop:
# It prints the current value of count.
# The count the variable is incremented by 1 (count += 1) to eventually meet the exit condition.    

# Example of loop controls: break and continue
for number in range(1, 10):  # Loop through numbers 1 to 9
    if number == 5:
        print("Breaking the loop at 5")
        break  # Exit the loop when number is 5
    elif number % 2 == 0:
        print(f"Skipping {number} because it's even")
        continue  # Skip the rest of the loop body for even numbers
    print(f"Processing number: {number}")
    
# break: Stops the loop entirely when number == 5.
# continue: Skips the current iteration when number is even and moves to the next loop iteration.    

# Python continue Statement

# The continue statement is used to skip the current iteration of the loop and the control flow of the program goes to the next iteration.

# While the break control statement will come in handy, there are other situations where we don’t want to end the loop entirely. What if we only want to skip the current iteration of the loop?



# Nested Loops

# In Python, loops can be nested inside other loops. Nested loops can be used to access items of lists which are inside other lists. The item selected from the outer loop can be used as the list for the inner loop to iterate over.

# Example code

# Example of a nested loop
for i in range(1, 4):  # Outer loop
    for j in range(1, 4):  # Inner loop
        print(f"Outer loop: {i}, Inner loop: {j}")