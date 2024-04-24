# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 10:57:42 2024

@author: pawel
"""

from vtk import vtkCylinderSource, vtkPolyDataMapper, vtkActor, vtkRenderer,vtkCubeSource
from vtk import vtkRenderWindow, vtkRenderWindowInteractor, vtkMatrix4x4
from vtkmodules.vtkRenderingCore import vtkAssembly
from vtkmodules.vtkCommonColor import vtkNamedColors
import numpy as np


def cylinderFactory(height, radius, resolution):
    cylinderSource = vtkCylinderSource()
    cylinderSource.SetRadius(radius)
    cylinderSource.SetHeight(height)
    cylinderSource.SetResolution(resolution)
    
    mapper = vtkPolyDataMapper()
    mapper.SetInputConnection(cylinderSource.GetOutputPort())
    actor = vtkActor()
    actor.SetMapper(mapper)
    
    return actor
    
    
def cubeFactory(xLength,yLength, zLength):
    cubeSource = vtkCubeSource()
    cubeSource.SetXLength(xLength)
    cubeSource.SetYLength(yLength)
    cubeSource.SetZLength(zLength)
    
    mapper = vtkPolyDataMapper()
    mapper.SetInputConnection(cubeSource.GetOutputPort())
    actor = vtkActor()
    actor.SetMapper(mapper)
    
    return actor

    
    return 1


cylinder_1 = cylinderFactory(5, 0.5, 100)
cylinder_2 = cylinderFactory(5, 0.5, 100)
cylinder_3 = cylinderFactory(5, 0.5, 100)

cube_1 = cubeFactory(2,6,1)
cube_2 = cubeFactory(2,6,1)

cylinder_1.AddPosition(0,-2,0)
cylinder_3.AddPosition(0,2,0)
cube_1.AddPosition(0,0,3)
cube_2.AddPosition(0,0,-3)

cylinder_1.RotateX(90)
cylinder_2.RotateX(90)
cylinder_3.RotateX(90)


assembly = vtkAssembly()
assembly.AddPart(cylinder_1)
assembly.AddPart(cylinder_2)
assembly.AddPart(cylinder_3)
assembly.AddPart(cube_1)
assembly.AddPart(cube_2)

assembly_new = vtkAssembly()
assembly_new.AddPart(cylinder_1)
assembly_new.AddPart(cylinder_2)
assembly_new.AddPart(cylinder_3)
assembly_new.AddPart(cube_1)
assembly_new.AddPart(cube_2)
assembly_new.AddPosition(3,-3,0)
assembly_new.RotateZ(90)

renderer = vtkRenderer()
renderWindow = vtkRenderWindow()
renderWindow.SetWindowName('Cylinder')
renderWindow.AddRenderer(renderer)
renderWindowInteractor = vtkRenderWindowInteractor()
renderWindowInteractor.SetRenderWindow(renderWindow)

renderer.AddActor(assembly)
renderer.AddActor(assembly_new)

renderWindow.Render()
renderWindowInteractor.Start()