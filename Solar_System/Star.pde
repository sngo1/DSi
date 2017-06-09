class Star implements CelestialObject {
  PImage star = loadImage("star.png");

  double radius;
  double scaledRadius;
  double speed;
  double scaledSpeed;
  double xCor;
  double yCor;
  double mass;
  int type; //0 = 

  color c;

  Star(int x, int y) {
    xCor = (int) random(600);
    yCor = (int) random(600);
    scaledRadius = 5;// NOT ACTUALLY TO SCALE

    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
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
}