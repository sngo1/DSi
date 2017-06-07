class Asteroid {

  float majorAxis;
  float minorAxis = 20;
  float xCor;
  float yCor;
  float xSpeed;
  float ySpeed;
  boolean placed = false;

  color c;

  void Asteroid() {
    majorAxis = (int) random(50);
    xCor = mouseX;
    yCor = mouseY;
  }

  void Asteroid(float firstX, float firstY, float secondX, float secondY) {
    xCor = firstX;
    yCor = firstY;
    xSpeed = secondX - firstX;
    ySpeed = secondY - firstY;
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
  }

  void draw() {
    if (!placed) {
      fill(c);
      ellipse (mouseX, mouseY, 2*radius, 2*radius);
    } else {
      
        
      
      
      
      
      
    // this.move();
  }

  void crash() {
  }

  int objectType() {
    return 2;
  }

  void move() {
    xCor += xSpeed / 60;
    yCor += ySpeed / 60;
  }

  boolean Crash() {
    return false; // TEMP
  }
}