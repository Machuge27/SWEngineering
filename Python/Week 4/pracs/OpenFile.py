# Reading data from an existing file

f = open('./data.txt', 'r')
print(f.readline(), end="")
print(f.readline())
print(f.readline())

f.close()

# How to write Data

write = open("write", "w")
write.append("Mastering file read and write and exceptions") # This writes new data to the file without changing the initial content 

# How To Append a File
write = open("write", "a")
# write.write(" This is Awesome") # This writes data once and this data file can be replaced
write.write(" This is Awesome") # This writes data once and this data file can be replaced


# Merge data from different files
for data in f:
    write.write(data)
