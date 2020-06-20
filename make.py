import os
import sys
import os.path

def showMenu():
    print("###################################################################################################")
    print("#                                         ModelSim tool                                           #")
    print("###################################################################################################")
    print("# 1- Syntetize                                                                                    #")
    print("# 2- Show results                                                                                 #")
    print("# 9- Exit                                                                                         #")
    print("###################################################################################################")


showMenu()

while True:

    while True:
        try:
            selection = int(input("Type another option or type 0 to show the menu again: "))
            break
        except:
            print("Digite um valor válido.")
    

    if selection == 0:
        showMenu()


    elif selection == 1:

        files = ""
        for dirpath, dirnames, filenames in os.walk("src"):
            for filename in [f for f in filenames if (f.endswith(".sv") or f.endswith(".v"))]:
                files += (os.path.join(dirpath, filename)) + " "

        print("Creating library...")
        os.system("vlib work")

        print("Syntetizing simulation...")
        os.system("vlog " + files)


    elif selection == 2:

        print("Showing simulation...")
        os.system("vsim Testbench")

    elif selection == 9:
        # Please dont uncomment this until the work is finished +_+
        os.system("git clean -ffxd :/")
        sys.exit(0)

    else:
        print("Digite um valor válido.")