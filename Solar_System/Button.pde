class Button {

  //BUTTON SETUP----------------------------------------------------------
  int asterX, asterY;    // Position of ASTEROID button
  int planetX, planetY;  // Position of PLANET button
  int starX, starY;      // Position of STAR button
  int randX, randY;      // Position of RANDADD button
  int undoX, undoY;
  int asterSize = 60;    // Diameter of ASTEROID button
  int planetSize = 60;   // Diameter of PLANET
  int starSize = 60;     // Diameter of STAR button
  int randSize = 63;     // Diameter of RANDADD button
  int undoSize = 60;
  color asterColor, planetColor, starColor, randColor, baseColor;
  color asterHighlight, planetHighlight, starHighlight, randHighlight;
  color currentColor;
  color undoColor;
  boolean asterOver = false;
  boolean planetOver = false;
  boolean starOver = false;
  boolean randOver = false;
  boolean undoOver = false;
  boolean asterPressed = false;
  boolean planetPressed = false;
  boolean starPressed = false;
  boolean randPressed = false;
  boolean undoPressed = false;
  //----------------------------------------------------------------------

  //FOOTER SETUP----------------------------------------------------------
  int footerX, footerY;
  int footerHeight = 100;
  int footerWidth = 600;
  color footerColor;
  //----------------------------------------------------------------------

  void setup() {
    // Sets all the colors needed
    asterColor = color(255, 0, 128);
    asterHighlight = color(255, 0, 128, 191);
    planetColor = color(163, 73, 164);
    planetHighlight = color(163, 73, 164, 191);
    starColor = color(0, 0, 255);
    starHighlight = color(0, 0, 255, 191);
    randColor = color(255);
    randHighlight = color(209);
    baseColor = color(0);
    currentColor = baseColor;

    // Sets the coordinates
    asterX = width/2-asterSize-100;
    asterY = height/2-asterSize/2+300;
    planetX = width/2-planetSize-25;
    planetY = height/2-planetSize/2+300;
    starX = width/2-starSize+50;
    starY = height/2-starSize/2+300;
    randX = width/2+randSize/2-275;
    randY = height/2+300;
    undoColor = color(0);
    undoX = 400;
    undoY = height/2+270;

    // Sets up toolbar dimensions
    footerColor = color(#89c6de);
    footerX = 0;
    footerY = height-footerHeight;
  }


  void draw() {
    update(mouseX, mouseY);
    background(currentColor);

    // Footer
    fill(footerColor);
    rect(footerX, footerY, footerWidth, footerHeight);


    if (asterOver) {
      fill(asterHighlight);
    } else {
      fill(asterColor);
    }
    noStroke();
    fill(255);
    ellipse(150,650, 70, 70);
    fill(asterColor);
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
    ellipse(250,650, 70, 70);
    fill(34, 120, 0);
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
    ellipse(350,650, 70, 70);
    fill(133, 50, 150);
    ellipseMode(CENTER);
    ellipse(350, 650, 60, 60);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("STAR", 350, 650);


    if (randOver) {
      fill(randHighlight);
    } else {
      fill(randColor);
    }
    noStroke();
    fill(255);
    ellipse(50,650, 70, 70);
    fill(133, 50, 150);
    ellipseMode(CENTER);
    ellipse(50, 650, 60, 60);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("RANDOM", 50, 650);

    stroke(255);
    rect(undoX, undoY, starSize, starSize);
    text("REMOVE LAST", undoX, undoY);
    fill(undoColor);
    //--------------------------

    if (randPressed) {
      randPressed = false;
      int choice = (int) random(3);
      // 0 = Asteroid
      if (choice == 0) {
        asterPressed = false;
        if (mousePressed && inSystem(mouseX, mouseY)) {
          int addX = mouseX;
          int addY = mouseY;
          Asteroid a = new Asteroid(addX, addY, 300, 300);
          lastAdded.add(a);
        }
      } 
      // 1 = Planet
      else if (choice == 1) {
        planetPressed = false;
        if (mousePressed && inSystem(mouseX, mouseY)) {
          int addX = 150;
          int addY = 450;
          Planet p = new Planet(addX, addY);
          lastAdded.add(p);
        }
      } 
      // 2 = Star
      else if (choice == 2) {
        if (mousePressed && inSystem(mouseX, mouseY)) {
          int addX = mouseX;
          int addY = mouseY;
          Star q = new Star(addX, addY);
          q.add();
          lastAdded.add(q);
          delay(300);
        }
        starPressed = false;
      }
      delay(300);
    }
    // Asteroid Button Pressed
    if (asterPressed) {
      asterPressed = false;
      if (mousePressed && inSystem(mouseX, mouseY)) {
        int addX = mouseX;
        int addY = mouseY;
        int dirX = 300;
        int dirY = 300;
        Asteroid a = new Asteroid(addX, addY, dirX, dirY);
        lastAdded.add(a);
      }
      delay(300);
    }
    if (planetPressed) {
      // fill(planetColor);
      // ellipse(mouseX, mouseY, 33, 33);
      planetPressed = false;
      if (mousePressed && inSystem(mouseX, mouseY)) {
        int addX = 160;
        int addY = 460;
        Planet p = new Planet(addX, addY);
        //     planets.add(p);
        lastAdded.add(p);
      }
      /*
    if(mousePressed && newPlanet){
       int addX = mouseX;
       int addY = mouseY;
       Planet p = new Planet(addX, addY);
       planets.add(p);
       lastAdded.add(p);
       newPlanet = false;
       }
       */
      delay(300);
    }
    if (starPressed) {
      fill(starColor);
      ellipse(mouseX, mouseY, 33, 33);
      if (mousePressed && inSystem(mouseX, mouseY)) {
        int addX = mouseX;
        int addY = mouseY;
        Star q = new Star(addX, addY);
        q.add();
        //       stars.add(q);
        lastAdded.add(q);
        delay(300);
      }
      starPressed = false;
    }
    if (undoPressed) {
      removeLast(); 
      delay(300);
      undoPressed = false;
    }
  }

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
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean overUndo() {
    if (mouseX < undoX+starSize && mouseX > undoX-starSize && mouseY > undoY - starSize && mouseY < undoY +starSize) {
      return true;
    } else {
      return false;
    }
  }

  boolean overPlanet(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean overStar(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
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


  boolean inSystem(int x, int y) {
    if (mouseX >= x && mouseX <= x+600 && 
      mouseY >= y && mouseY <= y+600) {
      return true;
    } else {
      return false;
    }
  }
}