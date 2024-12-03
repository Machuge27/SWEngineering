# Write an if/elif/else statement for a college with a grading system as shown below:
# If grade is 90 or higher, print "A"
# Else if grade is 80 or higher, print "B"
# Else if grade is 70 or higher, print "C"
# Else if grade is 60 or higher, print "D"
# Else, print "F"


def grade_score(score):
    if score >= 90:
        print("You've scored grade A")
    elif score >= 80:
        print("You've scored grade B")
    elif score >= 70:
        print("You've scored grade C")
    elif score >= 60:
        print("You've scored grade D")
    else:
        print("You've scored grade F")
    
def main():
    score = int(input("Enter your score: "))
    grade_score(score)
    
if __name__ == "__main__":
    main()
    