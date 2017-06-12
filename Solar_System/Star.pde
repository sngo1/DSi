class Star implements CelestialObject {
  PImage star = loadImage("star.png");

  double radius = 7;
  double xCor;
  double yCor;

  Star(int x, int y) {
    xCor = x;
    yCor = y;
  }

  void draw() {
    image(star, (float)xCor, (float)yCor, 30, 30);
  }

  // Accessors
  double getXCor() {
    return xCor;
  }
  double getYCor() {
    return yCor;
  }
  
  // Places star
  void add() {
    xCor = getXCor();
    yCor = getYCor();
  }

  // Determines if mouse is over star; used for deletion
  boolean isMouseOver() {
    if ((mouseX > xCor - radius) && 
        (mouseX < xCor + radius) && 
        (mouseY > yCor - radius) && 
        (mouseY < yCor + radius))
    { return true; }
    else { return false; }
  }

  String toString() {
    return "Star";
  }
}