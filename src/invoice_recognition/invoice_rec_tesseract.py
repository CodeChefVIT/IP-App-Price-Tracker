import pytesseract
from PIL import Image


img= Image.open('1017-receipt.jpg')

result = pytesseract.image_to_string(img)


text_file = open("D:/IP-App-Price-Tracker/src/invoice_recognition/tesseractDemoresult.txt", "w")
text_file.write(result)
text_file.close()
text_file=open("D:/IP-App-Price-Tracker/src/invoice_recognition/tesseractDemoresult.txt","r+")
print(text_file.readlines())
text_file.close()