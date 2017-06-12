// DSi's Solar Systems
// Team DSi - Despoina Sparakis, Vernita Law, Samantha Ngo 
// APCS2 - pd1 - Final Project

// Setup
ArrayList<CelestialObject> lastAdded = new ArrayList();
Button run;

// State Variables
boolean delete = false;    // Indicates if deleting an object
int state = 0;             // Indicates current state: 0 does nothing, 1 adds planets, 2 adds asteroids

// Start & End Pages
boolean finish = false;    
boolean start = true;
float xCor = 150;
float yCor = 407;
int changeX = 1;
int q;

// Images
PImage sun;
PImage end;

void setup() {
  size(600, 700);
  run = new Button();
  run.setup();

  // Loading end page image
  end = loadImage("Solar_System.png");

  // Randomizes starting Sun
  int sunType = (int) random(3);
  if (sunType == 0) {
    sun = loadImage("sun.png");
  } else if (sunType==1) {
    sun = loadImage("sun1.png");
  } else if (sunType ==2) {
    sun = loadImage("sun2.png");
  }
}

void draw() {  
  // If delete button selected...
  if (delete == true) {
    // ...then remove the next object selected
    for (int x = 0; x < lastAdded.size(); x++) {
      if (lastAdded.get(x).isMouseOver() && mousePressed) {
        lastAdded.remove(x); 
        delete = false;
      }
    }
  }
  
  // Draw the sun, buttons, and any objects that have been added to the solar system.
  run.draw();
  for (CelestialObject e : lastAdded) {
    e.draw();
  }
  imageMode(CENTER);
  image(sun, 300, 300, 70, 70);
  
  // Minor Debugging Code
  String array = "";
  for (CelestialObject e : lastAdded) {
    array += e + "|";
  }

  // Draw Finish Button
  noStroke();
  fill(255);
  ellipse(540, 60, 60, 60);
  fill(133, 0, 0);
  ellipseMode(CENTER);
  ellipse(540, 60, 50, 50);
  fill(255);
  textSize(16);
  textAlign(CENTER);
  text("FIN", 540, 65);

  // If Finish Button selected, initiate end page and ellipse
  if ((sqrt(sq(mouseX - 550) + sq(mouseY - 50)) <= 35) && mousePressed) {
    xCor = 170;
    yCor = 400;
    finish = true;
  }

  // Finish page initiated; draw finish page
  if (finish) {
    // Draw finish screen
    background(0);
    text("FIN", 300, 150);
    
    // Count the number of objects left in the solar system
    int asteroids = 0;
    int planets = 0;
    int stars = 0;

    for (CelestialObject e : lastAdded) {
      if (e.toString().equals("Asteroid")) {
        asteroids += 1;
      } else if (e.toString().equals("Planet")) {
        planets += 1;
      } else {
        stars += 1;
      }
    }
    
    // Display Stats
    textSize(25);
    textAlign(CENTER);
    text("What's left of your solar system:", 300, 220);
    text("Stars: " + stars, 300, 350);
    text("Asteroids: " + asteroids, 300, 400);
    text("Planets: " + planets, 300, 450);

    // Display Image
    image(end, 300, 600, 530, 80);

    // Orbiting Sphere
    fill(255);
    ellipse(xCor, yCor, 30, 30);
    
    if ( xCor >= 300 + 120) {
      changeX = -1;
      q = 0;
    } else if (xCor <= 300 - 120) {
      changeX = 1;
      q = 1;
    }
    xCor += changeX; 
    if ( q == 1) {
      yCor = 400 + sqrt(sq(120) - sq(xCor-300));
    } else if ( q == 0) {
      yCor = 400 - sqrt(sq(120) - sq(xCor-300));
    }
  }

  // Run start page until start button pressed
  if (start) {
    background(255);

    textSize(35);
    fill(0);
    text("DSi's Pocket Solar Systems", 300, 110);

    // Draw start button
    noStroke();
    fill(133, 0, 0);
    ellipse(300, 400, 70, 70);
    fill(255);
    ellipseMode(CENTER);
    ellipse(300, 400, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("START", 300, 407);

    // If start button pressed, stop drawing the start page and begin drawing the solar system
    if ((sqrt(sq(mouseX - 300) + sq(mouseY - 407)) <= 35) && mousePressed) {
      start = false;
    }

    // Start page orbiting sphere
    ellipse(xCor, yCor, 30, 30);
    if ( xCor >= 300 + 150) {
      changeX = -1;
      q = 0;
    } else if (xCor <= 300 - 150) {
      changeX = 1;
      q = 1;
    }
    xCor += changeX; 
    if ( q == 1) {
      yCor = 407 + sqrt(sq(150) - sq(xCor-300));
    } else if ( q == 0) {
      yCor = 407 - sqrt(sq(150) - sq(xCor-300));
    }
  }
}