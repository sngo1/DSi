class Button {
  // Button Locations
  int asterX, asterY;    // Position of ASTEROID button
  int planetX, planetY;  // Position of PLANET button
  int starX, starY;      // Position of STAR button
  int randX, randY;      // Position of RANDADD button
  int undoX, undoY;
  int deleteX, deleteY;

  // Button Sizes
  int asterSize = 60;    // Diameter of ASTEROID button
  int planetSize = 60;   // Diameter of PLANET
  int starSize = 60;     // Diameter of STAR button
  int randSize = 63;     // Diameter of RANDADD button
  int undoSize = 60;
  int deleteSize = 60;

  // Button Colors
  color asterColor, planetColor, starColor, randColor, baseColor, deleteColor;
  color asterHighlight, planetHighlight, starHighlight, randHighlight;
  color currentColor;
  color undoColor;

  // State Variables
  // *If over a button
  boolean asterOver = false;
  boolean planetOver = false;
  boolean starOver = false;
  boolean randOver = false;
  boolean undoOver = false;
  boolean deleteOver = false;
  // *If a button is pressed
  boolean asterPressed = false;
  boolean planetPressed = false;
  boolean starPressed = false;
  boolean randPressed = false;
  boolean undoPressed = false;
  boolean deletePressed = false;
  boolean stateJustChanged = false;

  // Footer Variables
  int footerX, footerY;
  int footerHeight = 100;
  int footerWidth = 600;
  color footerColor;

  void setup() {
    // Initialize button colors 
    deleteColor = color(255, 255, 255);
    asterColor = color(255, 0, 128);
    asterHighlight = color(255, 0, 128, 191);
    planetHighlight = color(163, 73, 164, 191);
    starHighlight = color(0, 0, 255, 191);
    randColor = color(255);
    randHighlight = color(209);
    baseColor = color(0);
    currentColor = baseColor;

    // Sets the coordinates
    asterX = 150;
    asterY = 650;
    planetX = 250;
    planetY = 650;
    starX = 350;
    starY = 650;
    randX = width/2+randSize/2-275;
    randY = 650;
    undoColor = color(0);
    undoX = 400;
    undoY = height/2+270;
    deleteX = 500;
    deleteY = height/2+270;

    // Sets up toolbar dimensions
    footerColor = color(#89c6de);
    footerX = 0;
    footerY = height - footerHeight;
  }


  void draw() {
    // Update the location of the mouse to see if it is over a button or not
    update();

    // Draw the background and footer
    background(currentColor);
    fill(footerColor);
    rect(footerX, footerY, footerWidth, footerHeight);

    if (randOver) {
      fill(randHighlight);
    } else {
      fill(randColor);
    }
    noStroke();
    fill(255);
    ellipse(50, 650, 70, 70);
    fill(255, 128, 0);
    ellipseMode(CENTER);
    ellipse(50, 650, 60, 60);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("RANDOM", 50, 650);

    if (asterOver) {
      fill(asterHighlight);
    } else {
      fill(asterColor);
    }
    noStroke();
    fill(255);
    ellipse(150, 650, 70, 70);
    fill(164, 91, 94);
    ellipseMode(CENTER);
    ellipse(150, 650, 60, 60);
    fill(0);
    textAlign(CENTER);
    text("ASTEROID", 150, 650);

    if (planetOver) {
      fill(planetHighlight);
    } else {
      fill(planetColor);
    }
    noStroke();
    fill(255);
    ellipse(250, 650, 70, 70);
    fill(159, 96, 143);
    ellipseMode(CENTER);
    ellipse(250, 650, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("PLANET", 250, 650);

    if (starOver) {
      fill(starHighlight);
    } else {
      fill(starColor);
    }
    noStroke();
    fill(255);
    ellipse(350, 650, 70, 70);
    fill(245, 204, 10);
    ellipseMode(CENTER);
    ellipse(350, 650, 60, 60);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("STAR", 350, 650);
    
    noStroke();
    fill(255);
    ellipse(450, 650, 70, 70);
    fill(218, 37, 123);
    ellipseMode(CENTER);
    ellipse(450, 650, 60, 60);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("REMOVE LAST", 450, 650);

    noStroke();
    fill(255);
    ellipse(550, 650, 70, 70);
    fill(234, 21, 53);
    ellipseMode(CENTER);
    ellipse(550, 650, 60, 60);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("DELETE", 550, 650);
    
    /*

    stroke(255);
    rect(undoX, undoY, starSize, starSize);
    text("REMOVE LAST", undoX + 30, undoY);
    fill(undoColor);

    stroke(255);
    rect(deleteX, deleteY, deleteSize, deleteSize);
    text("DELETE", deleteX + 30, deleteY);
    fill(deleteColor);
    */
    //-------------------------

    if (randPressed) {
      randPressed = false;
      int choice = (int) random(3);
      // 0 = Asteroid
      if (choice == 0) {
        asterPressed = false;
        state = 2;
        stateJustChanged = true;
      } 
      // 1 = Planet
      else if (choice == 1) {
        planetPressed = false;
        state = 1;
        stateJustChanged = true;
      }

      // 2 = Star
      else if (choice == 2) {
        state = 3;
        starPressed = false;
        stateJustChanged = true;
      }
      delay(300);
    }
    // Asteroid Button Pressed
    if (asterPressed) {
      asterPressed = false;
      state = 2;
      stateJustChanged = true;
      delay(300);
    }
    // Planet Button Pressed
    if (planetPressed) {
      planetPressed = false;
      state = 1;
      stateJustChanged = true;

      delay(300);
    }
    // Star Button Pressed
    if (starPressed) {
      state = 3;
      starPressed = false;
      stateJustChanged = true;
      starPressed = false;
    }
    // Remove Last Button Pressed
    if (undoPressed) {
      removeLast(); 
      delay(300);
      undoPressed = false;
    }

    // Delete an object
    int c = deleteX+deleteSize/2;
    int v = deleteY + deleteSize/2;
    if (mouseX>c-40 && mouseX<c+40 && mouseY>v-40 && mouseY<v+40 && mousePressed) {
      if (delete == false) {
        delete = true;
        deletePressed = false;
        delay(300);
      } else {
        delete = false;
        delay(300);
      }
    }
    if (!stateJustChanged) {
      makeObject();
    }
    stateJustChanged = false;
  }

  // Remove the last object added via the lastAdded ArrayList
  void removeLast() {
    if (lastAdded.size() > 0) {
      lastAdded.remove( lastAdded.size() - 1);
    }
  }

  /*
  // Updates the variables according to the mouse's new position
   void update(int x, int y) {
   if ( overRand(randX, randY, randSize) ) {
   randOver = true;
   asterOver = false;
   planetOver = false;
   starOver = false;
   } else if ( overAster(asterX, asterY, asterSize, asterSize) ) {
   asterOver = true;
   planetOver = false;
   starOver = false;
   randOver = false;
   } else if ( overPlanet(planetX, planetY, planetSize, planetSize) ) {
   planetOver = true;
   asterOver = false;
   starOver = false;
   randOver = false;
   } else if ( overStar(starX, starY, starSize, starSize) ) {
   starOver = true;
   asterOver = false;
   planetOver = false;
   randOver = false;
   } else if (overUndo()) {
   undoOver = true;
   if (mousePressed) {
   undoPressed = true;
   }
   } else {
   randOver = asterOver = planetOver = starOver = false;
   }
   
   if (mousePressed == true && overRand(randX, randY, randSize) ) {
   randPressed = true;
   } else if (mousePressed == true && overAster(asterX, asterY, asterSize, asterSize) ) {
   asterPressed = true;
   } else if (mousePressed == true && overPlanet(planetX, planetY, planetSize, planetSize) ) {
   planetPressed = true;
   } else if (mousePressed == true && overStar(starX, starY, starSize, starSize) ) {
   starPressed = true;
   }
   }
   
   boolean overAster(int x, int y, int width, int height) {
   if (mouseX >= asterX-40 && mouseX <= asterX+40 && 
   mouseY >= asterY-40 && mouseY <= asterY+40) {
   return true;
   } else {
   return false;
   }
   }
   
   boolean overUndo() {
   float w = undoX + starSize/2;
   float e = undoY +starSize/2;
   if (mouseX < w+30 && mouseX > w-30 && mouseY > e - 30 && mouseY < e +30) {
   return true;
   } else {
   return false;
   }
   }
   
   boolean overPlanet(int x, int y, int width, int height) {
   if (mouseX >= planetX-40 && mouseX <= planetX+40 && 
   mouseY >= planetY-40 && mouseY <= planetY+40) {
   return true;
   } else {
   return false;
   }
   }
   
   boolean overStar(int x, int y, int width, int height) {
   if (mouseX >= starX-40 && mouseX <= starX+40 && 
   mouseY >= starY-40 && mouseY <= starY+40) {
   return true;
   } else {
   return false;
   }
   }
   
   boolean overRand(int x, int y, int diameter) {
   float disX = x - mouseX;
   float disY = y - mouseY;
   if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
   return true;
   } else {
   return false;
   }
   }
   */
   
   boolean inSystem(int x, int y) {
   if (mouseX >= x && mouseX <= x+600 && 
   mouseY >= y && mouseY <= y+600) {
   return true;
   } else {
   return false;
   }
   }
   

  boolean ifOver(int x) {
    // Radius Threshold <= 35
    float calcRadius = sqrt(sq(mouseX - x) + sq(mouseY - 650));
    if (calcRadius <= 35) {
      return true;
    } else {
      return false;
    }
  }

  boolean update() {
    // Random button
    if (ifOver(50)) {
      randOver = true;
      // Changes mouseOver color
      fill(180, 88, 199);
      ellipseMode(CENTER);
      ellipse(50, 650, 60, 60);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("RANDOM", 50, 650);
      if (mousePressed) {
        randPressed = true;
        // buttonsPressed();
      }
    } else {
      randOver = randPressed = false;
    }

    // Asteroid button
    if (ifOver(150)) {
      asterOver = true;
      // Changes mouseOver color
      fill(180, 88, 199);
      ellipseMode(CENTER);
      ellipse(150, 650, 60, 60);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("ASTEROID", 150, 650);
      if (mousePressed) {
        asterPressed = true;
      }
    } else {
      asterOver = asterPressed = false;
    }

    // Planet Button
    if (ifOver(250)) {
      planetOver = true;
      // Changes mouseOver color
      fill(180, 88, 199);
      ellipseMode(CENTER);
      ellipse(250, 650, 60, 60);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("PLANET", 250, 650);
      if (mousePressed) {
        planetPressed = true;
      }
    } else {
      planetOver = planetPressed = false;
    }

    // Star Button 
    if (ifOver(350)) {
      starOver = true;
      // Changes mouseOver color
      fill(180, 88, 199);
      ellipseMode(CENTER);
      ellipse(350, 650, 60, 60);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("STAR", 350, 650);
      if (mousePressed) {
        starPressed = true;
      }
    } else {
      starOver = starPressed = false;
    }

    // Remove Last Button
    if (ifOver(450)) {
      undoOver = true;
      // Changes mouseOver color
      fill(180, 88, 199);
      ellipseMode(CENTER);
      ellipse(450, 650, 60, 60);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("REMOVE LAST", 450, 650);
      if (mousePressed) {
        undoPressed = true;
      }
    } else {
      undoOver = undoPressed = false;
    }

    // Delete Button
    if (ifOver(550)) {
      deleteOver = true;
      // Changes mouseOver color
      fill(180, 88, 199);
      ellipseMode(CENTER);
      ellipse(550, 650, 60, 60);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("DELETE", 550, 650);
      if (mousePressed) {
        deletePressed = true;
      }
    } else {
      deleteOver = deletePressed = false;
    }

    return true;
  }


  void makeObject() {
    if (mousePressed) {
      // Adding planet
      if (state == 2) {
        if (mousePressed && inSystem(mouseX, mouseY)) {
          int addX = mouseX;
          int addY = mouseY;
          Asteroid a = new Asteroid(asterX, asterY, addX, addY);
          lastAdded.add(a);
          state = 0;
        }
      } 
      // Adding Asteroid
      else if (state ==1) {
        if (inSystem(mouseX, mouseY)) {
          int addX = mouseX;
          int addY = mouseY;
          Planet p = new Planet(addX, addY);
          lastAdded.add(p);
        }
      } else if (state == 3) {
        if (inSystem(mouseX, mouseY)) {
          int addX = mouseX;
          int addY = mouseY;
          Star q = new Star(addX, addY);
          q.add();
          lastAdded.add(q);
        }
      }
      state = 0;
    }
  }
}