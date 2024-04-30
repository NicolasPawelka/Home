# -*- coding: utf-8 -*-
"""
Created on Tue Apr 30 11:24:11 2024

@author: pawel
"""
import numpy as np

class Quaternionen:
    def __init__(self,w,x,y,z):
        self.data = np.array([w,x,y,z])
        
    def norm(self):
        tmp = np.square(self.data)
        norm = tmp[0] + tmp[1] + tmp[2] + tmp[3]
        norm = np.sqrt(norm)
        
        print(norm) 
    
    def getData(self,i):
        return self.data[i]
    
    def produkt(self,other):
        r0 = self.data[0] * other.getData(0) - self.data[1] * other.getData(1) - self.data[2] * other.getData(2) - self.data[3] * other.getData(3)
        r1 = self.data[0] * other.getData(1) + self.data[1] * other.getData(0) + self.data[2] * other.getData(3) - self.data[3] * other.getData(2)
        r2 = self.data[0] * other.getData(2) - self.data[1] * other.getData(3) + self.data[2] * other.getData(0) + self.data[3] * other.getData(1)
        r3 = self.data[0] * other.getData(3) + self.data[1] * other.getData(2) - self.data[2] * other.getData(1) + self.data[3] * other.getData(0)
        
        tmp = np.array([r0,r1,r2,r3])
        
        tmp = f'{tmp[0]} + i{tmp[1]} + j{tmp[2]} + k{tmp[3]} '
        
        print(tmp)
    
    def rot(self):
        return 0
        
    def show(self):
        print(self.data)


tmp = Quaternionen(1, 2, 3, 4)
tmp_2 = Quaternionen(2, 3, 4, 5)
tmp.show()
tmp.norm()
tmp.produkt(tmp_2)
        
        