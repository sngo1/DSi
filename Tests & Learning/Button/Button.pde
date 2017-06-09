int asterX, asterY;    // Position of ASTEROID button
int planetX, planetY;  // Position of PLANET button
int starX, starY;      // Position of STAR button
int randX, randY;      // Position of RANDADD button
int asterSize = 90;    // Diameter of ASTEROID button
int planetSize = 90;   // Diameter of PLANET
int starSize = 90;     // Diameter of STAR button
int randSize = 93;     // Diameter of RANDADD button
color asterColor, planetColor, starColor, randColor, baseColor;
color asterHighlight, planetHighlight, starHighlight, randHighlight;
color currentColor;
boolean asterOver = false;
boolean planetOver = false;
boolean starOver = false;
boolean randOver = false;

void setup() {
  size(1500, 830);
  ellipse(50, 50, 100,100);
  fill(255);
  asterColor = color(255,0,128); //pink
  asterHighlight = color(255,0,128,191);
  planetColor = color(163,73,164); //purple
  planetHighlight = color(163,73,164,191);
  starColor = color(0,0,255); //blue
  starHighlight = color(0,0,255,191);
  randColor = color(255); //white
  randHighlight = color(209);
  baseColor = color(0);
  currentColor = baseColor;
  asterX = width/2-asterSize-400;
  asterY = height/2-asterSize/2+250;
  planetX = width/2-planetSize-300;
  planetY = height/2-planetSize/2+250;
  starX = width/2-starSize-200;
  starY = height/2-starSize/2+250;
  randX = width/2+randSize/2-650;
  randY = height/2+250;
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  if (asterOver) {
    fill(asterHighlight);
  } else {
    fill(asterColor);
  }
  stroke(255);
  rect(asterX, asterY, asterSize, asterSize);
  
  if (planetOver) {
    fill(planetHighlight);
  } else {
    fill(planetColor);
  }
  stroke(255);
  rect(planetX, planetY, planetSize, planetSize);
  
  if (starOver) {
    fill(starHighlight);
  } else {
    fill(starColor);
  }
  stroke(255);
  rect(starX, starY, starSize, starSize);
  
  if (randOver) {
    fill(randHighlight);
  } else {
    fill(randColor);
  }
  stroke(0);
  ellipse(randX, randY, randSize, randSize);
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
}

void mousePressed() {
  if (randOver) {
    currentColor = randColor;
  }
  if (asterOver) {
    currentColor = asterColor;
  }
  if (planetOver) {
    currentColor = planetColor;
  }
  if (starOver) {
    currentColor = starColor;
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