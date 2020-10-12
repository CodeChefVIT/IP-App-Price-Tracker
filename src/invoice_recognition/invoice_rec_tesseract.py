from flask import Flask, request, render_template
import pytesseract
import os
import cv2
import json
import re
from Levenshtein import distance
from werkzeug.utils import secure_filename

#starting Flask server to get image 
app = Flask(__name__, template_folder='templates')

#path to upload images
UPLOAD_FOLDER='D:/VIT-Hack-2020/ML/UPLOADS/'
ALLOWED_EXTENSIONS = set([ 'png', 'jpg', 'jpeg'])

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route("/")
def index():
  return render_template("index.html")
@app.route("/about")
def about():
  return render_template("about.html")

#basic dictionary to classify the text extracted from image after OCR processing
dic = {'category': [],
       'amount': [],
       'score': [],
       'tax': []}

#assigning directory for pytesseract
pytesseract.pytesseract.tesseract_cmd = r'C:\Users\USER\AppData\Local\Tesseract-OCR\tesseract.exe'
#OCR processing the Image into a string 
def ocr_process(img, resolution=450, page_seg_method='3'):
    txt=""
    txt = "".join([txt, pytesseract.image_to_string(img, lang="eng",config='--psm ' + page_seg_method)])
    return txt

#Categorising the Invoices according to some keywords from text extracted from the images
def categories(result_string,dic=dic):
    
    #Categories
    dining=re.findall('(server)|(Food)|(Dining)|(order)|(table)|(restaurant)',result_string, re.IGNORECASE)
    apparel=re.findall('(shirt)|(pant)|(jeans)|(clothing)|(sleeve)|(men)|(ladies)|(accessories)',result_string,re.IGNORECASE)
    medicine=re.findall('(medical)|(pharmacy)|(hospital)|(doctor)',result_string,re.IGNORECASE)
    groceries=re.findall('(convinience)|(grocery)|(market)|(supermarket)',result_string,re.IGNORECASE)
    transport =re.findall('(travels)|(transport)|(automobiles)|(car)|(bus)|(transportation)',result_string,re.IGNORECASE)
    entertainment=re.findall('(movie)|(theatre)|(film)|(books)',result_string,re.IGNORECASE)
    
    #Appending the Categories into the dictionary
    if(len(dining)!=0):
       dic['category'].append('Food')
    elif(len(apparel)!=0):
        dic['category'].append('Apparel')
    elif(len(medicine)!=0):
        dic['category'].append('Medical')
    elif(len(groceries)!=0):
        dic['category'].append('Groceries')
    elif(len(transport)!=0):
        dic['category'].append('Transportation')
    elif(len(entertainment)!=0):
        dic['category'].append('Entertainment')
    return dic

#Scoring - removing frequently used words with '%d'
def scoring(regex_expression, item):
    item_revised = re.sub('[0-9]{1,15}.{1,15}[0-9]{2}', '%d', item).lower()
    #removing most frequently repeated words
    item_revised = (item_revised.replace('total', '')
                    .replace('amount', '')
                    .replace('balance', '')
                    .replace('due', '')
                    .replace('$', '')
                    .replace('₹','')
                    .replace('USD', '')
                    .replace('INR','')
                    .strip())
    #if all the strings are replaced with '%d' scpre=100, even if one extra character the score will become less
    score = 100 - distance('%d', item_revised)   
    return score                                

#Extracting Total amount and Tax amount from the bill
def amount_parsser(invoice_string, regex_expression, dic=dic):
    #comparing using regular expression 
    target_found = re.findall(regex_expression['regex'], invoice_string, re.IGNORECASE)
    tax_found=re.findall(regex_expression['regex_tax'],invoice_string, re.IGNORECASE)
    
    if len(target_found) == 0 :
         print('Nothing matched')
         return dic
    else:
    #Total Amount Processing
        for ind, item in enumerate(target_found):
            if_tax_in_string = 'tax' in item.lower()
            if_last_in_string = 'last' in item.lower()
            
            if any([if_tax_in_string, if_last_in_string]):
                del(target_found[ind])  #delete the part with tax and last to find Total Amount

            else:
                target_amount = re.search('[0-9]{1,15}.{1,15}[0-9]{2}', item)
                
                if target_amount is not None:
                    #extract the amount and score it at the same time
                    score = scoring(regex_expression, item.lower())
                    amount = target_amount.group(0).replace(',', '')
                    
                    #appending values into the dictionary
                    dic['amount'].append(amount)
                    dic['score'].append(score)
    #Tax Amount Processing
        for ind,item in enumerate(tax_found):
        
            if_last_in_string = 'last' in item.lower()
            if (if_last_in_string):
                del(target_found[ind])  
                
            tax_amount=re.search('[0-9]{1,15}.{1,15}[0-9]{2}', item)
            
            if tax_amount is not None:
                 #extract the amount and score it at the same time
                    score = scoring(regex_expression, item.lower())
                    tax = tax_amount.group(0).replace(',', '')  
                    
                    #appending values into the dictionary
                    dic['tax'].append(tax)
        return dic                           #return updated Dictionary


#Checking allowed extensions of image
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

#Request file, process it and return json file with information
@app.route('/uploader', methods=['GET', 'POST'])
def upload_file():
    
    if request.method == 'POST':
       # check if the post request has the file part
        if 'file' not in request.files:
            print('No file part')
            
        file = request.files['file']
        if file.filename == '':
            print('No selected file')
            
    #Getting the Image from Server and Calling the Processing Functions
        if file and allowed_file(file.filename):            
            
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            #reading the image
            img= cv2.imread(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            img=cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            #calling OCR function
            ocr_result=ocr_process(img)
            #Regular Expression for finding Total and Tax Amount
            totalAmountRegex = {'regex_tax': '(gst[^0-9]{1,30}[0-9,]*\.\d\d)',
                                 'regex':'(?<!Tax )(?<!Sub)(?<!Sub )(Total[^0-9]{1,30}[0-9,]*\.\d\d)'}
           
            #final dictionary that contains updated values
            result_dic=categories(ocr_result,dic)
            result_dic = amount_parsser(ocr_result, totalAmountRegex, dic)
            #converting dictionary into json file
            app_json = json.dumps(result_dic, sort_keys=True)
            #returning json file back 
            return app_json


if __name__ == '__main__':
    app.run()