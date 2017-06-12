class Star implements CelestialObject {
  PImage star = loadImage("star.png");

  double radius = 7;
  double scaledRadius;
  double speed;
  double scaledSpeed;
  double xCor;
  double yCor;
  double mass;
  int type; //0 = 


  Star(int x, int y) {
    xCor = x;
    yCor = y;
    scaledRadius = 5;// NOT ACTUALLY TO SCALE
  }

  void add() {
    xCor = getXCor();
    yCor = getYCor();
  }

  void draw() {
    image(star, (float)xCor, (float)yCor, 30, 30);
  }

  boolean Move() {
    return true;
  }

  double getXCor() {
    return xCor;
  }

  double getYCor() {
    return yCor;
  }

  int objectType() {
    return 0;
  }

  boolean isMouseOver() {
    if (mouseX > xCor - radius && mouseX < xCor + radius && mouseY > yCor - radius && mouseY < yCor + radius)
    {
      return true;
    }
    return false;
  }

  String toString() {
    return "Star";
  }
}