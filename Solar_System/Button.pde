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
    footerColor = color(#47476b);
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

    // Draws Random Button
    noStroke();
    fill(255);
    ellipse(50, 650, 70, 70);
    if (randOver) {
      fill(200);
    } else {
      fill(255, 128, 0);
    }
    ellipseMode(CENTER);
    ellipse(50, 650, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("RANDOM", 50, 655);

    // Draws Asteroid Button
    noStroke();
    fill(255);
    ellipse(150, 650, 70, 70);
    ellipseMode(CENTER);
    if (asterOver) {
      fill(200);
    } else {
      fill(164, 91, 94);
    }
    ellipse(150, 650, 60, 60);
    fill(0);
    textAlign(CENTER);
    text("ASTEROID", 150, 655);

    // Draws Planet Button
    noStroke();
    fill(255);
    ellipse(250, 650, 70, 70);
    if (planetOver) {
      fill(200);
    } else {
      fill(159, 96, 143);
    }
    ellipseMode(CENTER);
    ellipse(250, 650, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("PLANET", 250, 655);

    // Draws Star Button
    noStroke();
    fill(255);
    ellipse(350, 650, 70, 70);
    if (starOver) {
      fill(200);
    } else {
      fill(245, 204, 10);
    }
    ellipseMode(CENTER);
    ellipse(350, 650, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("STAR", 350, 655);

    // Draws Remove Last Button
    noStroke();
    fill(255);
    ellipse(450, 650, 70, 70);
    if (undoOver) {
      fill(200);
    } else {
      fill(218, 37, 123);
    }
    ellipseMode(CENTER);
    ellipse(450, 650, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("REMOVE LAST", 450, 655);

    // Draws Delete Button
    noStroke();
    fill(255);
    ellipse(550, 650, 70, 70);
    if (deleteOver) {
      fill(200);
    } else {
      fill(234, 21, 53);
    }
    ellipseMode(CENTER);
    ellipse(550, 650, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("DELETE", 550, 655);

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

  // Determines if mouse is in solar system space
  boolean inSystem(int x, int y) {
    if (mouseX >= x && mouseX <= x+600 && 
      mouseY >= y && mouseY <= y+600) {
      return true;
    } else {
      return false;
    }
  }

  // Determines if the mouse is over a button
  boolean ifOver(int x) {
    // Radius Threshold <= 35
    float calcRadius = sqrt(sq(mouseX - x) + sq(mouseY - 650));
    if (calcRadius <= 35) {
      return true;
    } else {
      return false;
    }
  }

  // Updates the variables according to the mouse's new position
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

  // Creates the appropriate object as selected
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
      }
      // Adding Star
      else if (state == 3) {
        if (inSystem(mouseX, mouseY)) {
          int addX = mouseX;
          int addY = mouseY;
          Star q = new Star(addX, addY);
          q.add();
          lastAdded.add(q);
        }
      }
      // Otherwise, nothing happens
      state = 0;
    }
  }
}