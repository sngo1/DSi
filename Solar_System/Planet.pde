class Planet implements CelestialObject {

  float planetRadius = 16;
  // double speed;
  float xCor;
  float yCor;
  float scaledOrbitR;
  float xCenter = 300;
  float yCenter = 300;
  float q;
  float changeX = 1;
  color c;

  Planet(int x, int y) {
    xCor = x;
    yCor = y;
    scaledOrbitR = getOrbitRad();

    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
  }

  void draw() {
    orbit();
    noStroke();
    ellipse ( xCor, yCor, 2 * planetRadius, 2 * planetRadius);
    fill(c);
  }

  void crash() {
  }

  int objectType() {
    return 1;
  }

  float getOrbitRad() {
    float r = sqrt( sq(xCor - xCenter) + sq(yCor - yCenter)); 

    // ================================
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

    if (firstQuad || secondQuad) {
      q = 0;
    } else if ( thirdQuad || fourthQuad) {
      q = 1;
    }
    return r;
  }  
  
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
  
  Boolean isMouseOver(){
   if(mouseX > xCor - planetRadius && mouseX < xCor + planetRadius && mouseY > yCor - planetRadius && mouseY < yCor + planetRadius){
    return true; 
   }
   return false;
  }
}