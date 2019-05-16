from g2p_en import G2p
import pandas as pd
import re
import numpy as np

def test_g2p(texts):
  g2p = G2p()
  out = []
  
  # s.translate(str.maketrans('', '', string.punctuation))
  
  for text in texts:
    out.append(g2p(re.sub(r'[^\w\s]','',text)))
    
  return(np.matrix(out))
  
# ["I have $250 in my pocket.", # number -> spell-out
#          "popular pets, e.g. cats and dogs", # e.g. -> for example
#          "I refuse to collect the refuse around here.", # homograph
#          "I'm an activationist."]
  
# test_g2p(["I have $250 in my pocket.", # number -> spell-out
#          "popular pets, e.g. cats and dogs", # e.g. -> for example
#          "I refuse to collect the refuse around here.", # homograph
#          "I'm an activationist."])

