class Planet implements CelestialObject {

  PImage planet1 = loadImage("planet1.png");
  PImage planet2 = loadImage("planet2.png");
  PImage planet3 = loadImage("planet3.png");
  PImage planet4 = loadImage("planet4.png");
  
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
  int planetType;

  Planet(int x, int y) {
    xCor = x;
    yCor = y;
    scaledOrbitR = getOrbitRad();
    planetType = (int) random(4);
/*    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );*/
  }

  void draw() {
    orbit();
    if(planetType == 0){
      image(planet1, (float)  xCor, (float) yCor, 30, 30);
    }
    else if(planetType ==1){
      image(planet2, (float)  xCor, (float) yCor, 70, 70);      
    }
    else if(planetType ==2){
        image(planet3, (float)  xCor, (float) yCor, 40, 40);
    }
    else if(planetType ==3){
      image(planet4, (float)  xCor, (float) yCor, 20, 20);      
    }
    //noStroke();
    //ellipse ( xCor, yCor, 2 * planetRadius, 2 * planetRadius);
    //fill(c);
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

    // ================================
    /*   
     if(yCor > yCenter){
     q = 1; 
     }
     else if(yCor < yCenter){
     q = 0; 
     }
     else{
     if(xCor  < xCenter){
     q = 0; 
     }
     else{
     q = 1;
     }
     }*/

    return r;
  }  
/*
  int keyPressed() {
    /*   String str = "";
     char ch;
     if(key != 'a'){
     ch = key;
     str +=  Character.toString(ch);
     }
     if(str.equals("")){
     return 0;
     }
     else{
    int num = Character.getNumericValue(key);
    return num;
  }
*/

  void orbit() {
    
    if(yCor > yCenter){
    if ( xCor >= xCenter + scaledOrbitR) {
      changeX = -1;
      q = 0;
    } else if (xCor <= xCenter-scaledOrbitR) {
      changeX = 1;
      q = 1;
    }
    }
=
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