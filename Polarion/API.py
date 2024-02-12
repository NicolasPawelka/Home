from polarion import polarion
import tkinter as tk
from tkinter import messagebox
import warnings

warnings.filterwarnings("ignore")


def on_button_click():
    username = entry_username.get()
    password = entry_password.get()
    client = polarion.Polarion('https://polarion-dev2.newtec.zz/polarion',username,password,verify_certificate=False)
    project = client.getProject('Spielprojekt_IEC62443')
    workitem = project.getWorkitem('SIEC-1900')
    print("###############################")
    print(workitem.getResolutionEnum())
    print(workitem.getSeverityEnum())
    print(workitem.getStatusEnum())
    print(workitem.getAvailableStatus())
    print("###############################")
    



def run_script():
    new_window = tk.Toplevel(root)
    new_window.title("Run")


    run_button = tk.Button(new_window, text="Run Script", command=on_button_click)
    run_button.pack()



root = tk.Tk()
root.title("Anmelden")

label_username = tk.Label(root, text="Benutzername:")
label_username.pack()
entry_username = tk.Entry(root, width=50)
entry_username.pack()

label_password = tk.Label(root, text="Passwort:")
label_password.pack()
entry_password = tk.Entry(root, show="*", width=50)
entry_password.pack()

login_button = tk.Button(root, text="Anmelden", command=run_script)
login_button.pack()

root.mainloop()
