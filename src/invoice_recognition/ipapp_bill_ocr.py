import easyocr
import PIL
from PIL import ImageDraw
import keras
from keras.preprocessing.image import save_img
from keras.preprocessing.image import img_to_array
reader = easyocr.Reader(['en'], gpu = False)
im = PIL.Image.open("1184-receipt.jpg")
bounds = reader.readtext('1184-receipt.jpg')
def draw_boxes(image, bounds, color='yellow', width=2):
    draw = ImageDraw.Draw(image)
    for bound in bounds:
        p0, p1, p2, p3 = bound[0]
        draw.line([*p0, *p1, *p2, *p3, *p0], fill=color, width=width)
    return image

print(draw_boxes(im, bounds))
for i in bounds:
    print(i[1])
img_array = img_to_array(im)
save_img('1184-receipt-boxed.jpg', img_array)