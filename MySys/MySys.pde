// Display Variables
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

// Functional Variables
ArrayList<Planet> planets;
ArrayList<Star> stars;
// ArrayList<Asteroid> asteroids;
boolean asterPressed = false;
boolean planetPressed = false;
boolean starPressed = false;
boolean randPressed = false;
boolean clearPressed = false;
boolean placeObject = false;

// Initial setup
void setup() {
  size(800, 900);
}

// Main Driver - to be looped
void draw() {
  screen();
}

// Sets up the screen and the toolbar.
void screen() {
  // Overall background color
  background(59, 59, 150);

  // Toolbar
  int footerHeight = 100;
  int footerWidth = 800;
  color footerColor =  color(#89c6de);
  int footerX = 0;
  int footerY = height - footerHeight;

  fill(footerColor);
  rect(0, height - 100, width, 100);

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
  asterX = 100;
  asterY = height - 75;
  planetX = 170;
  planetY = height - 75;
  starX = 240;
  starY = height - 75;
  randX = 50;
  randY = height - 40;
  clearX = starX + 100;
  clearY = starY;
  clearColor = color(0);

  if (asterOver) {
    fill(asterHighlight);
  } else {
    fill(asterColor);
  }
  stroke(255);
  rect(asterX, asterY, asterSize, asterSize);
  // textMode(CENTER);
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
  //---------------------------------------------------------------------
}

boolean overRand() {
  //float disX = randX - mouseX;
  //float disY = randY - mouseY;
  if (sqrt(sq(randX - mouseX) + sq(randY - mouseY)) < randSize/2 ) {
    return true;
  } else {
    return false;
  }
}

void mouseOver() {
  // If over asteroid button
  if (mouseX >= asterX && mouseX <= asterX+width && 
    mouseY >= asterY && mouseY <= asterY+height) {
    asterOver = true;
    planetOver = false;
    starOver = false;
    randOver = false;
  } 
  // If over planet button
  else if (mouseX >= planetX && mouseX <= planetX+width && 
    mouseY >= planetY && mouseY <= planetY+height) {
    planetOver = true;
    asterOver = false;
    starOver = false;
    randOver = false;
  } 
  // If over star button
  else if (mouseX >= starX && mouseX <= starX+width && 
    mouseY >= starY && mouseY <= starY +height) {
    starOver = true;
    asterOver = false;
    planetOver = false;
    randOver = false;
  } 
  // If over random button
  else if ( overRand() ) {
    randOver = true;
    asterOver = false;
    planetOver = false;
    starOver = false;
  } else {
    randOver = asterOver = planetOver = starOver = false;
  }

  if (mousePressed == true) {
    if (randOver) {
      randPressed = true;
    } else if (asterOver) {
      asterPressed = true;
    } else if (planetOver) {
      planetPressed = true;
    } else if (starPressed) {
      starPressed = true;
    }
  }
}

void mouseClicked() {
  // When placing an object onto the solar system after a button is initially clicked
  if(placeObject){
    
  }
  // When you initially click a button
  else if (!placeObject) {
    if (randOver) {
      int z = (int) random(3);
      if ( z == 0) {
        // Initialize a planet
        ~~~~~~
      } else if (z == 1) {
        // Initialize an asteroid
        ~~~~~~
      } else {
        // Initialize a star
        ~~~~~~
      }
    } else if (asterOver){
      // Initialize an asteroid
      ~~~~~
    } else if (starOver){
      // Initialize a star
      ~~~~~
    } else if(planetOver){
      // Initialize a planet
      ~~~~~
    }
    // Otherwise, don't touch anything...
  } 
    
}