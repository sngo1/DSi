class Asteroid implements CelestialObject {
  PImage asteroid = loadImage("asteroid.png");
  
  float radius = 10;
  float xCor;
  float yCor;
  float xSpeed;
  float ySpeed;

  color c;

  Asteroid(int firstX, int firstY, int secondX, int secondY) {
    xCor = firstX;
    yCor = firstY;
    xSpeed = secondX - firstX;
    ySpeed = secondY - firstY;
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
  }

  void draw(){
   image(asteroid, xCor, yCor, 60, 60);
   this.move();
  }
  
  void crash(){
  }
  
  int objectType(){
    return 2;
  }
  
  void move(){
   xCor += xSpeed / 60;
   yCor += ySpeed / 60;
  }
  
  Boolean isMouseOver(){
      if(mouseX > xCor - radius && mouseX < xCor + radius && mouseY > yCor - radius && mouseY < yCor + radius){
    return true; 
   }
   return false; 
  }
  
}