class Button{

//BUTTON SETUP----------------------------------------------------------
int asterX, asterY;    // Position of ASTEROID button
int planetX, planetY;  // Position of PLANET button
int starX, starY;      // Position of STAR button
int randX, randY;      // Position of RANDADD button
int clearX, clearY;
int asterSize = 60;    // Diameter of ASTEROID button
int planetSize = 60;   // Diameter of PLANET
int starSize = 60;     // Diameter of STAR button
int randSize = 63;     // Diameter of RANDADD button
int clearSize = 60;
color asterColor, planetColor, starColor, randColor, baseColor;
color asterHighlight, planetHighlight, starHighlight, randHighlight;
color currentColor;
color clearColor;
boolean asterOver = false;
boolean planetOver = false;
boolean starOver = false;
boolean randOver = false;
boolean asterPressed = false;
boolean planetPressed = false;
boolean starPressed = false;
boolean randPressed = false;
boolean clearPressed = false;
//----------------------------------------------------------------------

//FOOTER SETUP----------------------------------------------------------
int footerX, footerY;
int footerHeight = 100;
int footerWidth = 600;
color footerColor;
//----------------------------------------------------------------------

void setup() {
 // size(1000, 700);
  
  //BUTTON--------------------
  asterColor = color(255,0,128);
  asterHighlight = color(255,0,128,191);
  planetColor = color(163,73,164);
  planetHighlight = color(163,73,164,191);
  starColor = color(0,0,255);
  starHighlight = color(0,0,255,191);
  randColor = color(255);
  randHighlight = color(209);
  baseColor = color(0);
  currentColor = baseColor;
  asterX = width/2-asterSize-100;
  asterY = height/2-asterSize/2+300;
  planetX = width/2-planetSize-25;
  planetY = height/2-planetSize/2+300;
  starX = width/2-starSize+50;
  starY = height/2-starSize/2+300;
  randX = width/2+randSize/2-275;
  randY = height/2+300;
  clearX = starX + 100;
  clearY = starY;
  clearColor = color(0);
  //--------------------------
  
  //FOOTER--------------------
  footerColor = color(#89c6de);
  footerX = 0;
  footerY = height-footerHeight;
  //--------------------------

}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  //FOOTER--------------------
  fill(footerColor);
  rect(footerX, footerY, footerWidth, footerHeight);
  //--------------------------
  
  //BUTTON--------------------
  if (asterOver) {
    fill(asterHighlight);
  } else {
    fill(asterColor);
  }
  stroke(255);
  rect(asterX, asterY, asterSize, asterSize);
  text("ASTEROID", asterX, asterY);
  
  if (planetOver) {
    fill(planetHighlight);
  } else {
    fill(planetColor);
  }
  stroke(255);
  rect(planetX, planetY, planetSize, planetSize);
  text("PLANET", planetX+10, planetY);
  
  if (starOver) {
    fill(starHighlight);
  } else {
    fill(starColor);
  }
  stroke(255);
  rect(starX, starY, starSize, starSize);
  text("STAR", starX+15, starY);
  
  if (randOver) {
    fill(randHighlight);
  } else {
    fill(randColor);
  }
  stroke(0);
  ellipse(randX, randY, randSize, randSize);
  text("RANDOM", randX-randSize/2+7, randY-randSize/2-1);
  //--------------------------
  
  if (randPressed){
    fill(randColor);
    ellipse(mouseX, mouseY, 33, 33);
    randPressed = false;
    int choice = (int)random(3);
    if (choice == 0){
      fill(asterColor);
      ellipse(mouseX, mouseY, 33, 33);
      asterPressed = false;
      if(mousePressed && inSystem(mouseX, mouseY)){
        int addX = mouseX;
        int addY = mouseY;
        Asteroid a = new Asteroid(addX, addY, 300, 300);
 //       asteroid.add(p);
        lastAdded.add(a);
      }
    } else if (choice == 1){
      fill(planetColor);
      ellipse(mouseX, mouseY, 33, 33);
      planetPressed = false;
      if(mousePressed && inSystem(mouseX, mouseY)){
        int addX = mouseX;
        int addY = mouseY;
        Planet p = new Planet(addX, addY);
 //       planets.add(p);
        lastAdded.add(p);
      }
    } else if (choice == 2) {
      fill(starColor);
      ellipse(mouseX, mouseY, 33, 33);
      if(mousePressed && inSystem(mouseX, mouseY)){
        int addX = mouseX;
        int addY = mouseY;
         Star q = new Star(addX, addY);
         q.add();
//         stars.add(q);
         lastAdded.add(q);
         delay(300);
      }
      starPressed = false;
    }
    delay(300);
  }
  if (asterPressed){
    fill(asterColor);
    ellipse(mouseX, mouseY, 33, 33);
    asterPressed = false;
    if(mousePressed && inSystem(mouseX, mouseY)){
      int addX = mouseX;
      int addY = mouseY;
      int dirX = 300;
      int dirY = 300;
      Asteroid a = new Asteroid(addX, addY, dirX, dirY);
 //     asteroid.add(p);
      lastAdded.add(a);
    }
    delay(300);
  }
  if (planetPressed){
    fill(planetColor);
    ellipse(mouseX, mouseY, 33, 33);
    planetPressed = false;
    if(mousePressed && inSystem(mouseX, mouseY)){
      int addX = mouseX;
      int addY = mouseY;
      Planet p = new Planet(addX, addY);
 //     planets.add(p);
      lastAdded.add(p);
    }
    delay(300);
  }
  if (starPressed){
    fill(starColor);
    ellipse(mouseX, mouseY, 33, 33);
    if(mousePressed && inSystem(mouseX, mouseY)){
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
  } else {
    randOver = asterOver = planetOver = starOver = false;
  }
  
  if (mousePressed == true && overRand(randX, randY, randSize) ) {
    randPressed = true;
  } else if (mousePressed == true && overAster(asterX, asterY, asterSize, asterSize) ){
    asterPressed = true;
  } else if (mousePressed == true && overPlanet(planetX, planetY, planetSize, planetSize) ) {
    planetPressed = true;
  } else if (mousePressed == true && overStar(starX, starY, starSize, starSize) ) {
    starPressed = true;
  }

}

boolean overAster(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overPlanet(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overStar(int x, int y, int width, int height)  {
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