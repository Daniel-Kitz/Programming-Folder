import audiolab
from pylab import *

signal, fs, enc = wavread('Kindred.wav')

specgram(signal)

