import os

fms_folder = "G:/Games/X-Plane_11/Output/FMS plans"
fd_w = open(fms_folder + "fms_extract.txt","w")
for path, dirs, filenames in os.walk(fms_folder):
    for file in filenames:
        print("\n" + file)
        fd_w.write("\n\n" + file + "\n")
        fd_r = open(path + "/" +file,"r")
        for line in fd_r:
            line_arr = line.split()
            if line_arr.__len__() > 2:
                fd_w.write(line_arr[1] + " ")

fd_w.close()
fd_r.close()