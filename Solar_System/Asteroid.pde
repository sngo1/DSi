class Asteroid implements CelestialObject {

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
   ellipse (xCor, yCor, 2*radius, 2*radius);
   fill(c);
   this.move();
  }
  
  void crash(){
   //Not sure what this should do 
  }
  
  int objectType(){
    return 2;
  }
  
  void move(){
   xCor += xSpeed / 60;
   yCor += ySpeed / 60;
  }
  
/*  void display() {
    fill(c);
    ellipse (  xCor, yCor, (float) ( 2 * radius ), (float) ( 2 * radius ) );
  }*/
  
}