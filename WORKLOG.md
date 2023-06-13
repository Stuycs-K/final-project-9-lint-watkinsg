# Work Log

## Gus

### 5/22

Talked about UML and worked on overhaul of UML

### 5/23

Research ControlP5, continue GUI 'screen' setup/design


## Tracey

### date 5/22

started making basic classes and drew diagram and separate work
tried to add the picture of the diagram at home

### date 5/23

learned ez super basic level of matrix multiplication and how to find the inverse of a matrix and coded encrypt method, started on coding the inverse of the key matrix
at home, finish all the functions and made a testing branch, it's wrong rn but i will fix it
did testing, trying to figure out problem

### date 5/24

in class: finish float[][] and allow input of various length
at home: did a bit of testing, it's mostly working, or enough for mvp but needs tweaking, the determinent seems off
also got mvp done for the encrypting part, gonna work on making it available in different matrixes

### date 5/25

in class: did more testing, and figured out the problem
at home: it only works for invertible and modable matrixes but at least now it works, time to work on allowing lowercase number and space too
fix the problem now any workable key works and allows lowercase number and space

### date 5/26

read about control p 5

### date 5/27

read more about control p 5 and discuss with gus what is the work distributon later

### date 5/28

work on adding cp5 to the encrypt and decrypt function

### date 5/29

tested encrypt decrypt with user interface and made sure it works

### date 5/30

added extra key options and a method for random key generator

### date 5/31

read more about controlp5, moved buttons to their spot, changed color, made array into string for visualization, basically making the screen look nicer

### date 6/1

try to show key for visualization purpose but the keys kept on overlapping each other
fix the problem and made visualization show key input and output and changes it when the input and key changes too

### date 6/2

read more about cp5, what is textfield, textlabel, color, colorvalue, etcetcetc and talk to gus

### date 6/3

discuss next step and work distribution and what to do next
read over gus's changes, did not merge cause i could not understand, well i do but it interfere with my works
worked on adding other ciphers, namely caesar (had to learn what caesar is 💀)
added morse code cause y not

### date 6/4

finish morse code
try to test them, does not work idk y, looked at other ciphers

### date 6/5

talk with gus about visualization and what to say during demo and demoed, annnnnnnnd i figure out why it kept overlapping its because we never clear the background in draw herqiohugiflekhigudfkjqfwhsaufikhqwusdf
at least i no longer hate controlp5 🙃

### date 6/6

talk with gus and distributed the work, i do visualization for hillcipher and morse code and he do the visualization for caesar and base64 which he will added
set the background to a darker color (y does it take so long TT)
fix bug in caesar an morse
start visualization for hillcipher by trying to keep all the necessary component in hillcipher

### date 6/7

solve cp5 error, apparently me just dumb and blind
more visualization planning

### date 6/8

start working on visualization and planning how it is going to work
try to organize the cp5 stuffs into individual classes and try different type of making it more organized and easier to change later

### date 6/9

work on what happens to screen when the cipher changes and try to understand more about cp5 why is it not working TT

### date 6/10

finish visualization for MorseCode and screen change when switching between ciphers
fix hillcipher previous error

### date 6/11

finish visualization for Caesar and update prototype work on uml and log everything aka all the extraneous stuff
add newkey function to caesar and hide the button for morse


I. Working features
- Hill Cipher encryption and decryption
- Morse Code encryption and decryption
- Caesar encryption and decryption
- use the dropdown to display all the cipher types
- change the cipher by clicking on the cipher you want
- change the screen background based on the cipher chosen
- display the key of the ciphers (Hill Cipher, Morse Code, and Caesar)
- newKey Button that automatically generates a new key when clicked
- highlight the input elements in the key and their corresponding value

II. Broken features
- can not show the in between steps for the encryption and decryption process because draw only works after all of the functions finish running (realized that we need a tick() too late)
- cannot show the process of numbers or characters drifting on the screen because I could not figure out how to do it with ControlP5 and also the same problem with the draw() mentioned above
- Cannot do pop ups messages to warn the user about illegal input because I don't know how to do that in processing
- cannot make the key for Hill Cipher NxN matrix because it starts to become hard to satisfy the requirement (be modable by the amount of characters that could be encrypted and have an inverse matrix)
- cannot change the items in the dropdown after initialization because I don't know ControlP5 that well
- did not have time to add keyboard shortcuts

III. Helpful Resources
- ControlP5 document https://sojamo.de/libraries/controlP5/reference/allclasses-noframe.html to look for useful classes and their methods
- Processing forum https://forum.processing.org/one/allforums.html to see how ControlP5 is supposed to be used and answering some questions I have with why ControlP5 behaves this way
- StackOverFlow for general coding questions
- Mr. K's website for useful methods he wrote before
- https://www.dcode.fr/hill-cipher this thing that showed me how hill cipher works and allows me to check if my method correctly encrypted stuff
