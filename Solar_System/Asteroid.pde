class Asteroid implements CelestialObject {
  PImage asteroid = loadImage("asteroid.png");

  float radius = 10;
  float xCor;
  float yCor;
  float xSpeed;
  float ySpeed;

  Asteroid(int firstX, int firstY, int secondX, int secondY) {
    xCor = firstX;
    yCor = firstY;
    xSpeed = secondX - firstX;
    ySpeed = secondY - firstY;
  }

  void draw() {
    // Consistently update and redraw the asteroid position
    image(asteroid, xCor, yCor, 30, 30);
    this.move();
  }

  void move() {
    // Reduce speed
    xCor += xSpeed / 60;
    yCor += ySpeed / 60;
  }

  // Determines is mouse is over asteroid
  boolean isMouseOver() {
    if (mouseX > xCor - radius && mouseX < xCor + radius && mouseY > yCor - radius && mouseY < yCor + radius) {
      return true;
    }
    return false;
  }

  String toString() {
    return "Asteroid";
  }
}