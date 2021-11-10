# Fully_Connected_Graph_Drawer

This program draws a simple spherical graph of any given number of points where each point used to draw the circle is connected to every other point in the circle.  The number of points used to draw this circle can be changed during execution of the program, by using the up and down arrows to raise and lower the number of points respectively.

The program begins by drawing a circle using only 10 points, however the user can increase or decrease the number of points used to draw the circle using the up and down arrows on the keyboard.  Each time an arrow is pressed, the graph is automatically redrawn with the updated number of points.

The program also provides some modularity in the code. In the CHANGE section, the values of each variable can be changed to update where and how the graph is drawn.  The DON'T CHANGE section is also documented to explain how the code is working, but none of the code needs to be changed to apply any asthetic difference to the graph.

Lastly, if you wish to change the size of the program screen, note that you must also change the values for the size() function within the setup() function in the following manner:

void setup() {
  
  size(NEW_X, NEW_Y);
  
  ...
