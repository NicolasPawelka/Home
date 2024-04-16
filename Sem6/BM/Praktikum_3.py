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

cylinder_new = vtkCylinderSource()
cylinder_new.SetCenter(5.0,0.0,0.0)
cylinder_new.SetRadius(0.5)
cylinder_new.SetHeight(5.0)
cylinder_new.SetResolution(100)


colors = vtkNamedColors()

mapper = vtkPolyDataMapper()
mapper.SetInputConnection(cylinderSource.GetOutputPort())
actor = vtkActor()
actor.GetProperty().SetColor(colors.GetColor3d(farbe))
actor.RotateX(45)
actor.SetMapper(mapper)

mapper_new = vtkPolyDataMapper()
mapper_new.SetInputConnection(cylinder_new.GetOutputPort())
actor_new = vtkActor()
actor_new.GetProperty().SetColor(colors.GetColor3d(farbe))
actor_new.RotateY(45)
actor_new.SetMapper(mapper_new)


renderer = vtkRenderer()
renderWindow = vtkRenderWindow()
renderWindow.SetWindowName('Cylinder')
renderWindow.AddRenderer(renderer)
renderWindowInteractor = vtkRenderWindowInteractor()
renderWindowInteractor.SetRenderWindow(renderWindow)

renderer.AddActor(actor)
renderer.AddActor(actor_new)
renderer.SetBackground(colors.GetColor3d('DarkGreen'))



renderWindow.Render()
renderWindowInteractor.Start()








