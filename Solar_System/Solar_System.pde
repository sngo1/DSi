int numStars; // Can't be greater than 5
Boolean delete = false;
int state = 0; // 0 does nothing, 1 adds planets, 2 adds asteroids

Button test;

ArrayList<CelestialObject> lastAdded;
// ArrayList lastAdded = new Arraylist();
PImage sun;

void setup() {
  size(600, 700);
  test = new Button();
  test.setup();
  lastAdded = new ArrayList();

  sun = loadImage("sun.png");
}

void draw() {
  if(delete == true){
    for(int x = 0; x < lastAdded.size(); x++){
      if(lastAdded.get(x).isMouseOver() && mousePressed){
       lastAdded.remove(x); 
       delete = false;
      }
    }
  }
  test.draw();
  for (CelestialObject e : lastAdded) {
    e.draw();
  }
  imageMode(CENTER);
  image(sun, 300, 300, 70, 70);
}

void clear() {
  // planets = new ArrayList();
  // stars = new ArrayList();
}

// Setups the toolbar and buttons
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

void removeLast() {
  if (lastAdded.size() > 0) {
    lastAdded.remove( lastAdded.size() - 1);
  }
}