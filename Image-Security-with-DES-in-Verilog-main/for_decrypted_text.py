from PIL import Image

with open("decrypted_text.txt", "r") as f:
    array= f.readlines()

#print(len(array))
count=0
pixel=[]
for i in range(len(array)):
    if(count):
        pixel.append(array[i])
    else:
        count=17
    count -=1

with open("final_decryption.txt","w") as f:
    for i in range(len(pixel)):
        f.write(str(pixel[i])+"")
