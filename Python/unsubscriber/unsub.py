import pyautogui
from time import sleep

opened = False

if opened == False:
    pyautogui.moveTo(100, 1066, duration=0.2)
    pyautogui.leftClick()
    opened = True

n = 0

while n != 44:
    pyautogui.moveTo(1663,183,duration=0.3)
    pyautogui.leftClick()
    sleep(1)
    pyautogui.moveTo(121,595,duration=0.3)
    pyautogui.leftClick()
    sleep(1)
    n += 1