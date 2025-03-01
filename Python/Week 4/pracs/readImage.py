# Reading an Image
image = open("setup.jpg", "rb")
for i in image:
    print(i)

# Copying the image into another file

copyImg = open("setup_copy.png", "wb")
for i in image:
    copyImg.write(i)
    
# Closing the files
image.close()
copyImg.close()