import requests
'''
I've used locasl directory for the sake of testing the module
Modify the url according to the other modules
'''

filename='D:/IP-App-Price-Tracker/src/invoice_recognition/reciept_image_dataset/1204-receipt.jpg'
url = 'http://127.0.0.1:5000/'  #I've used this for testing purpose

# files = {'image': (open(filename, 'rb'), "image/jpeg")}

files = {"file": ( open(filename, "rb"))}
headers = {'authorization': "Bearer {token}"}
# print(requests.post(url, files=files))

response = requests.request("POST", url, files=files, headers=headers)
print(response.text)
