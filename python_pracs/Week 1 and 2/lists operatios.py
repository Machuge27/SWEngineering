prime_numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
print("Initial PN",prime_numbers)
# Output: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
even_numbers = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
print("Initial EN",even_numbers)
# Output: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# Concatenation
numbers = prime_numbers + even_numbers
print("Concat using +",numbers)

#Extend fxn
prime_numbers.extend(even_numbers)
print("Concat using extend",prime_numbers)


# Repetition
print("Repetition",even_numbers * 3)

# Membership
print("Membership",2 in even_numbers)
# Output: True

# Iteration
for num in even_numbers:
    print("Iteration",num)
    
#del fxn
del prime_numbers[1]
print("Del",prime_numbers)

#count fxn
print("Count",prime_numbers.count(2))
    
#Remove fxn
prime_numbers.remove(2)

#pop fxn
prime_numbers.pop(3)
print("Pop",prime_numbers)

#clear fxn
prime_numbers.clear()
print("Clear",prime_numbers)

#sort fxn
even_numbers.sort()
print("Sort",even_numbers)    

#insert fxn
even_numbers.insert(2, 5)
print("Insert",even_numbers)

#reverse fxn
even_numbers.reverse()
print("Reverse",even_numbers)


#List comprehension

# List comprehension is an elegant way to define and create lists based on existing lists.
print("List comprehension")
squares = [i * i for i in range(10)]
print(squares)