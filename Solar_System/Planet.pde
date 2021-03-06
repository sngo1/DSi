class Planet implements CelestialObject {

  PImage planet1 = loadImage("planet1.png");
  PImage planet2 = loadImage("planet2.png");
  PImage planet3 = loadImage("planet3.png");
  PImage planet4 = loadImage("planet4.png");
  color c;
  int r = (int) random(256);
  int g = (int) random(256);
  int b = (int) random(256);

  float planetRadius = (int) random(5,31);
  float xCor;
  float yCor;
  float scaledOrbitR;
  float xCenter = 300;
  float yCenter = 300;
  float q;
  float changeX = 1;
  int planetType;

  // Constructor - places the planet
  Planet(int x, int y) {
    xCor = x;
    yCor = y;
    scaledOrbitR = getOrbitRad();
    planetType = (int) random(100);
  }

  void draw() {
    // Movement
    orbit();
    // Randomizes a planet
    if (planetType <= 10) {
      image(planet1, xCor, yCor, 30, 30);
    } else if (planetType <= 20) {
      image(planet2, xCor, yCor, 70, 70);
    } else if (planetType <= 30) {
      image(planet3, xCor, yCor, 40, 40);
    } else if (planetType <= 40) {
      image(planet4, xCor, yCor, 25, 25);
    } else if (planetType <= 45) {
      int r = (int) random(256);
      int g = (int) random(256);
      int b = (int) random(256);

      noStroke();
      c = color(r, g, b);
      fill(c);
      ellipse(xCor, yCor, planetRadius * 2, planetRadius * 2);
    } else {
      noStroke();
      c = color(r, g, b);
      fill(c);
      ellipse(xCor, yCor, planetRadius * 2, planetRadius * 2);
    }
  }

  // Determines which equation to use depending on the quadrant it is in.
  float getOrbitRad() {
    float r = sqrt( sq(xCor - xCenter) + sq(yCor - yCenter)); 

    boolean firstQuad = false;
    boolean secondQuad = false;
    boolean thirdQuad = false;
    boolean fourthQuad = false;
    boolean xAxis = false;

    if ( xCor < xCenter) {
      if (yCor < yCenter) {
        secondQuad = true;
      } else {
        thirdQuad = true;
      }
    } else if (yCor == yCenter) {
      q = 2;
    } else {
      if (yCor > yCenter) {
        fourthQuad = true;
      } else {
        firstQuad = true;
      }
    }

    if (firstQuad || secondQuad) {      q = 0;
      changeX = -1;
    } else if ( thirdQuad || fourthQuad) {
      q = 1;
    }

    return r;
  }  

  // Calculates x and y for an orbit
  void orbit() {
    if ( xCor >= xCenter + scaledOrbitR) {
      changeX = -1;
      q = 0;
    } else if (xCor <= xCenter-scaledOrbitR) {
      changeX = 1;
      q = 1;
    }
    xCor += changeX; 

    if ( q == 1) {
      yCor = yCenter + sqrt(sq(scaledOrbitR) - sq(xCor-xCenter));
    } else if ( q == 0) {
      yCor = yCenter - sqrt(sq(scaledOrbitR) - sq(xCor-xCenter));
    }
  }

  // Determines if the mouse is over a planet; used for deletions
  boolean isMouseOver() {
    if (mouseX > xCor - planetRadius && mouseX < xCor + planetRadius && mouseY > yCor - planetRadius && mouseY < yCor + planetRadius) {
      return true;
    }
    return false;
  }

  String toString() {
    return "Planet";
  }
}