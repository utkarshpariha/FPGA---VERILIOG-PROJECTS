# Image Security using DES in Verilog
Any information sent over a communication channel undergoes encryption to maintain confidentiality and ensure that the imformation is not hacked or intercepted. At the intended reciver end, the encrypted data is decrypted and the actual information is retrieved. Data Encryption Standard (DES) is one of the earliest fundamental algorithms of cryptography. In DES, decryption is possible only at the reciver because only the sender and receiver have the same key. Here, a verilog implementation for encryption and decryption on images is presented by utilizing the Electronic Code Block (ECB) mode of DES.

- The original image which is to be trasmitted over a communication channel and needs to be encrypted:

   <img src="Images/Original Image.jpg" style="float: left;" alt="drawing" width="300"/>

 - Compressed image in grayscale for faster processing:
   
   <img src="Images/resized.png" style="float: left;" alt="drawing" width="300"/>

 - Encrypted image which gets transmitted over the channel:
   
   <img src="Images/encrypted_image.jpg" style="float: left;" alt="drawing" width="300"/>

  - Decrypted image at the reciever:

    <img src="Images/decrypted_image.jpg" style="float: left;" alt="drawing" width="300"/>

## Execution order of the codes: 
1.	Give an image as input to **imgtobin.py** to grayscale and resize it as well as convert it to hexadecimal format. In this code first a raw plaintext will be generated in which each line consists of 8 bits which represent the intensity levels of a single pixel. Since the image is 200x200 pixels, total 40,000 pixels are present. So, there will be 40,000 lines. The next part of the code formats this file so there are 8 bytes per line. So, 5000 lines in plaintext.txt.
2.	Give ‘plaintext.txt’ as input to **Encryption.v** and obtain ‘ciphertext.txt’ as output.
3.	Refine ‘ciphertext.txt’ by giving it as input to **for_ciphertext.py** and get ‘final_ciphertext.txt’ as output which is our final encrypted binary file. It should be 5000 lines, each line 8*8=64 bits. 
4.	Convert ‘final_ciphertext.txt’ to an encrypted image using bintoimg.py.
5.	In **Decryption.v**, give ‘final_ciphertext.txt’ as input and obtain decrypted text.
6.	Give decrypted text as input to **for_decrypted_text.py** and obtain final decrypted text.
7.	Using **bintoimg.py** convert final decrypted to obtain decrypted image.

