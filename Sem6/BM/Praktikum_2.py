# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 11:54:08 2024

@author: pawel
"""

import numpy as np


def transform(var):
        
    var =  np.append(var, [1])
    return var

def Matrix_trans(vektor):
    vektor = transform(vektor)
    vektor = np.vstack(vektor)
    print(vektor)
    
    tmp = np.eye(4)
    tmp[:,3:] = vektor
    
    
    return tmp

def Matrix_rot(winkel,axis):
    
    matrix = np.eye(4)

    
    if(axis == "x"):
        matrix [1,1:3] = [np.cos(winkel), -1*np.sin(winkel)]
        matrix[2,1:3] = [np.sin(winkel), np.cos(winkel)]
    
    return matrix

var = np.arange(1,4)
print(Matrix_trans(var))

tmp = Matrix_rot(30, "x")
print(tmp)