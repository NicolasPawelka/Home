import win32com.client as win32
from win32com.client import constants as pjconstants
import pandas as pd
import pytz
from datetime import datetime
import tkinter as tk
from tkinter import filedialog, simpledialog, messagebox
import math
from openpyxl import load_workbook
from openpyxl.styles import Font,Color
import re
import sys
import os
from pyxll import xl_func, xl_macro
##########################
DEMO = True
EXCEL = None
PROJECT = None
EXCEL_FILE_PATH = None
ACTIVE_PROJECT = None
TASKS = None
WORKBOOK = None
WORKSHEET = None
SHEET_NAME = None
DATA = []
KEY = []
#########################
def get_positiion():
    global EXCEL
    active_sheet = EXCEL.ActiveSheet
    
    for i, sheet in enumerate(EXCEL.Worksheets, 1):
        if sheet.Name == active_sheet.Name:
            return i - 1
    return None

def choose_project_file():
    root = tk.Tk()
    root.withdraw()
    
    file_path = filedialog.askopenfilename(filetypes=[("Project-Dateien", "*.mpp")])
    return file_path

def init(excel_file_path):
    global EXCEL
    global EXCEL_FILE_PATH
    global PROJECT
    global ACTIVE_PROJECT
    global TASKS
    global WORKSHEET
    
    project_file_path = choose_project_file()
    
    PROJECT = win32.Dispatch("MSProject.Application")
    EXCEL = win32.Dispatch("Excel.Application")
    EXCEL_FILE_PATH = excel_file_path
    WORKSHEET = EXCEL.ActiveWorkbook.Sheets("1. Software Entwicklungssupport")
    PROJECT.FileOpen(project_file_path)
    
    ACTIVE_PROJECT = PROJECT.ActiveProject
    TASKS = ACTIVE_PROJECT.Tasks
    main()

def sorting_key(item):
    parts = item.split('.')
    return [int(part) if part.isdigit() else part for part in parts]
    
def main():
    global EXCEL
    global EXCEL_FILE_PATH
    global PROJECT
    global ACTIVE_PROJECT
    global TASKS
    global WORKSHEET
    global KEY
    
    if TASKS is None:
        messagebox.showerror("Error", "Keine Project Daten erhalten")
        sys.exit(1)
        
    for task in TASKS:
        KEY.append(f"{get_positiion()}.{task.OutlineNumber}")
        DATA.append(task.Name)
        DATA.append(task.Start.strftime('%d-%m-%Y %H:%M:%S'))
        DATA.append(task.Finish.strftime('%d-%m-%Y %H:%M:%S'))
    if DATA is None:
        messagebox.showerror("Error", "DATA ist leer")
        sys.exit(1)
    EXCEL.Application.Run("Transfer",DATA,KEY)
    messagebox.showinfo("Completed", "Import der Daten erfolgreich!")
    
                

if __name__ == "__main__":
    if DEMO is False:
        if len(sys.argv) != 2:
            messagebox.showerror("Error","Fehler bei der Ermittlung des Commands")
            sys.exit()
        else:
            excel_path = sys.argv[1]
            init(excel_path)
        
    init(r"C:\Users\npawelka\Desktop\PDCA\PDCA_ETO.EEVACTUATOR.Entw.016.xlsm")