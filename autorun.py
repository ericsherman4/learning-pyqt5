# some helpful documentation https://docs.python.org/3/library/os.path.html
# https://stackabuse.com/executing-shell-commands-with-python/
import os
import time
import keyboard
import sys

#global var
firsttime = True

#this dummyparam is because the on_press_key function will return the event handler to the callback
#this prevents compiler errors
def runprogram(dummyparam):
    os.system("clear")
    os.system("py " + filename)
    print("Program halted.")
    global firsttime #this tells python that you want firsttime to be tied to the global instance of it and telling it NOT to create a local copy
    firsttime = True


if __name__ == "__main__":
    if(len(sys.argv) > 1):
        if(len(sys.argv) != 2):
            raise ValueError("Too many arguments provided. Please provide only one filename.")
        filename = sys.argv[1]
        if(not os.path.isfile(filename)):
            raise Exception("File does not exist. Please try again")
    else:
        filename = "main.py" #if no argument provided, run hardcoded filename  
    time_modified = os.path.getmtime(filename) #store the file modication time

    # check for the keypress
    # See methods 1-4 here https://stackoverflow.com/questions/24072790/detect-key-press-in-python
    keyboard.on_press_key('right shift', runprogram)

    while(1):
        time.sleep(0.1)
        if firsttime:
            print("Script is still running..")
            firsttime = False
        mod_time_compare_val = os.path.getmtime(filename) #store the file modication time
        #check to see if the file has changed
        if int(mod_time_compare_val) != int(time_modified):
            time_modified = mod_time_compare_val
            runprogram(44)




# print(os.path.getatime(filename)) #returns last access of path datetime.
# print(os.path.getctime(filename)) #returns file creation datetime.
# print(os.path.getmtime(filename)) #returns last modified datetime.