from PIL import Image

object = Image.open("tree.jpg")
object = object.convert("L")
object = object.resize((200, 200))
object.save('resized.png')
image = list(object.getdata())

encrypt=[]
for j in range(len(image)):
    encrypt.append(hex(image[j])[2:])

with open("raw_plaintext.txt", "w") as a:
    for i in range(len(encrypt)):
        a.write(str(encrypt[i])+"\n")
fileobj=open("raw_plaintext.txt","r")
required=open("plaintext.txt","w")
lines=[]
for line in fileobj:
    lines.append(line.strip())
count=8
print(len(lines))
love=0
print(lines[35570])
for x in lines:
    if(len(x)==1):
     x="0"+x
    if(count==0):
     count=8
     required.write('\n')
     required.write(x)
     count=count-1
    else:
     required.write(x)
     count=count-1

    
    

