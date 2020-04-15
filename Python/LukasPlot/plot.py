import pyautogui
from time import sleep
import os
import tkinter as tk
from tkinter import filedialog
import pytesseract
import cv2
from PIL import Image


pytesseract.pytesseract.tesseract_cmd = r'C:\\Program Files\\Tesseract-OCR\\tesseract.exe'

opened = False
n = -1
amount = 0

if opened == False:
    pyautogui.moveTo(100, 1066, duration=0.2)
    pyautogui.leftClick()
    opened = True

pyautogui.moveTo(1464,80,duration=0.2)
pyautogui.leftClick()
for i in range(0,8):
    n += 1
    screen = pyautogui.screenshot(region=(0,0, 300, 400))
    screen.save(r'C:/Users/Daniel/Documents/Daten/ordner/Programmier Ordner/Python/LukasPlot/screenshots/screen' + str(n) + '.png')
    amount += 1
    for i in range(0,21):
        pyautogui.scroll(-30)

pyautogui.moveTo(0,0)
n = -1

for i in range(0, amount):
    n += 1
    path_to_image = r'C:/Users/Daniel/Documents/Daten/ordner/Programmier Ordner/Python/LukasPlot/screenshots/screen0.png'
    img = Image.open(path_to_image)
    text = pytesseract.image_to_string(img)
    print(text)

