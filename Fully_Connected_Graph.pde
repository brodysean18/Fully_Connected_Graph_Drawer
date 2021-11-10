/********************** FULLY CONNECTED GRAPH VIEWER **********************/

/* 
 * Copyright (C)  2021  Sean Barton
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *
 *
 *
 *
 * This program draws a simple spherical graph of any given number
 * of points where each point used to draw the circle is connected
 * to every other point in the circle.
 *
 * The program begins by drawing a circle using only 10 points,
 * however the user can increase or decrease the number of points
 * used to draw the circle using the up and down arrows on the
 * keyboard.  Each time an arrow is pressed, the graph is
 * automatically redrawn with the updated number of points.
 *
 * The program also provides some modularity in the code. In the
 * CHANGE section below, the values of each variable can be
 * changed to update where and how the graph is drawn.  The
 * DON'T CHANGE section underneath is also documented to explain how
 * the code is working, but none of the code needs to be changed
 * to apply any asthetic difference to the graph.
 *
 * Lastly, if you wish to change the size of the program screen,
 * note that you must also change the values for the size()
 * function within the setup() function below in the following
 * manner:
 *
 * void setup() {
 *   size(NEW_X, NEW_Y);
 *   ...
 *
 *
 *
 *
 *
 * Last Updated: 11/3/21
 */
 



/********************************* CHANGE! ********************************/
/* VARIABLES DEFINING SIZE AND LOCATION ON THE SCREEN
 * ARE MEASURED IN PIXELS.
 * VARIABLES DEFINING COLOR ARE EITHER HEXADECIMAL
 * COLOR VALUES OR A GRAYSCALE VALUE BETWEEN 0 AND 255.
 */

// Adjusts the size of the game screen
// (Must also change size() to the same values)
final int SIZE_X = 1500;
final int SIZE_Y = 1000;

// Adjusts the BackGround color of the game screen,
// as well as the Line Color and Line Weight of
// the graph.  You can use the color selector,
// (Tools -> Color Selector) to easily choose a color.
final int BG = #191A1C;
final int LC = #447E56;
final int LW = 1;   // Measured in pixels

// Adjusts the Radius and origin of the graph
final int R = 400;
final int X = 750;
final int Y = 500;

// Adjusts the number of points used to draw the graph
int numPoints = 10;

/**************************************************************************/



/****************************** DON'T CHANGE! *****************************/
boolean update = true;

// Clears the screen and draws a new fully connected
// spherical graph using the number of points defined
// by the global variable numPoints.
void drawShape() {
  background(BG);
  
  for(int i = 0; i < numPoints; ++i) {
    float x1 = (cos(radians((360F/numPoints) * i)) * R) + X;
    float y1 = (sin(radians((360F/numPoints) * i)) * R) + Y;
    for(int j = 0; j < numPoints; ++j) {
      float x2 = (cos(radians((360F/numPoints) * j)) * R) + X;
      float y2 = (sin(radians((360F/numPoints) * j)) * R) + Y;
      line(x1, y1, x2, y2);
    }
  }
  update = false;
}

// Initializes the screen with a size, background color,
// and line color/weight
void setup() {
  size(1500, 1000);
  background(BG);
  stroke(LC);
  strokeWeight(LW);
}

// Called repeatedly (24 times per second).  Draws the scene
void draw() {
  if(update) { drawShape(); }
}

// Interrupt for any key being pressed.
void keyPressed() {
  // Adds a new point and redraws the graph when up arrow pressed
  if(keyCode == UP) {
    numPoints++;
    update = true;
  }
  // Removes as point and redraws the graph when down arrow pressed
  else if(keyCode == DOWN) {
    if(numPoints > 1) {
      numPoints--;
      update = true;
    }
  }
}
/**************************************************************************/
