# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 10:58:00 2024

@author: pawel
"""

from vtk import vtkCylinderSource, vtkPolyDataMapper, vtkActor, vtkRenderer
from vtk import vtkRenderWindow, vtkRenderWindowInteractor
from vtkmodules.vtkCommonColor import vtkNamedColors


farbe = input("Bitte gewünschte Farbe des Zylinders eingeben: ")


cylinderSource = vtkCylinderSource()
cylinderSource.SetCenter(0.0, 0.0, 0.0)
cylinderSource.SetRadius(0.5)
cylinderSource.SetHeight(5.0)
cylinderSource.SetResolution(100)

colors = vtkNamedColors()

mapper = vtkPolyDataMapper()
mapper.SetInputConnection(cylinderSource.GetOutputPort())
actor = vtkActor()
actor.GetProperty().SetColor(colors.GetColor3d(farbe))
actor.SetMapper(mapper)


renderer = vtkRenderer()
renderWindow = vtkRenderWindow()
renderWindow.SetWindowName('Cylinder')
renderWindow.AddRenderer(renderer)
renderWindowInteractor = vtkRenderWindowInteractor()
renderWindowInteractor.SetRenderWindow(renderWindow)

renderer.AddActor(actor)
#renderer.SetBackground(colors.GetColor3d('DarkGreen'))


renderWindow.Render()
renderWindowInteractor.Start()








