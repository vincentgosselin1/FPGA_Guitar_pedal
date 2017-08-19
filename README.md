# This is a Guitar pedal I made with an Altera FPGA (DE1-SoC)
This project as been  made for my FPGA class at Ecole de Technologie Superieure.
I used Qsys to make an softcore NIOSII to run a main program in C. I also used
Altera's Sound IP Core to interact with the audio chip, Wolfson WM8731. The
buttons on the DE1-SoC card are to change effects. 

There are 4 different configuration of the pedal selectable
 with the pushbuttons: 
1) no-sound processing
2) Distortion
3) Delay
4) Octavier 

Here is a picture of the guitar pedal : 
![img_1234](https://user-images.githubusercontent.com/16928726/29488474-15abbbea-84da-11e7-86f3-32adefe5004e.JPG)

A closer look on the electronics :
![img_1233](https://user-images.githubusercontent.com/16928726/29488477-1f78a4d0-84da-11e7-998d-c29aad208f65.JPG)

The signal path :
![screen shot 2017-08-19 at 12 31 57 pm](https://user-images.githubusercontent.com/16928726/29488502-73ba5ad4-84da-11e7-9390-6d16e021e029.png)

A final report (in french)  has been made describing the project in details. The PDF contains all the VHDL, Qsys screen captures and 
C code that I made.

The entire work can be found under the 20170721B_projet_1 folder. 

Vincent Gosselin, 2017.
