int numStars; // Can't be greater than 5
Boolean delete = false;
int state = 0; // 0 does nothing, 1 adds planets, 2 adds asteroids
boolean finish = false;
boolean start = true;
float xCor = 150;
float yCor = 407;
int changeX = 1;
int q;

Button test;

ArrayList<CelestialObject> lastAdded;
// ArrayList lastAdded = new Arraylist();
PImage sun;
PImage end;

void setup() {
  size(600, 700);
  test = new Button();
  test.setup();
  lastAdded = new ArrayList();

  int sunType = (int) random(3);
  if (sunType==0) {
    sun = loadImage("sun.png");
  } else if (sunType==1) {
    sun = loadImage("sun1.png");
  } else if (sunType ==2) {
    sun = loadImage("sun2.png");
  }

  end = loadImage("Solar_System.png");
}


void draw() {  
  if (delete == true) {
    for (int x = 0; x < lastAdded.size(); x++) {
      if (lastAdded.get(x).isMouseOver() && mousePressed) {
        lastAdded.remove(x); 
        delete = false;
      }
    }
  }
  test.draw();
  for (CelestialObject e : lastAdded) {
    e.draw();
  }
  imageMode(CENTER);
  image(sun, 300, 300, 70, 70);
  String array = "";
  for (CelestialObject e : lastAdded) {
    array += e + "|";
  }

  noStroke();
  fill(255);
  ellipse(550, 50, 70, 70);
  fill(133, 0, 0);
  ellipseMode(CENTER);
  ellipse(550, 50, 60, 60);
  fill(255);
  textSize(16);
  textAlign(CENTER);
  text("DONE", 550, 50);

  if ((sqrt(sq(mouseX - 550) + sq(mouseY - 50)) <= 35) && mousePressed) {
    finish = true;
  }

  if (finish) {
    int asteroids = 0;
    int planets = 0;
    int stars = 0;

    background(0, 0);
    text("FIN", 300, 150);
    for (CelestialObject e : lastAdded) {
      if (e.toString().equals("Asteroid")) {
        asteroids += 1;
      } else if (e.toString().equals("Planet")) {
        planets += 1;
      } else {
        stars += 1;
      }
    }
    textSize(25);
    textAlign(CENTER);
    text("What's left of your solar system:", 300, 250);
    text("Stars: " + stars, 300, 300);
    text("Asteroids: " + asteroids, 300, 350);
    text("Planets: " + planets, 300, 400);

    image(end, 300, 500, 510, 80);
  }

  if (start) {
    background(255);

    textSize(35);
    fill(0);
    text("DSi's Pocket Solar Systems", 300, 110);

    noStroke();
    fill(133, 0, 0);
    ellipse(300, 400, 70, 70);
    fill(255);
    ellipseMode(CENTER);
    ellipse(300, 400, 60, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("START", 300, 407);

    if ((sqrt(sq(mouseX - 300) + sq(mouseY - 407)) <= 35) && mousePressed) {
      start = false;
    }

    ellipse(xCor, yCor, 30, 30);
    if ( xCor >= 300 + 150) {
      changeX = -1;
      q = 0;
    } else if (xCor <= 300 - 150) {
      changeX = 1;
      q = 1;
    }
    xCor += changeX; 

    if ( q == 1) {
      yCor = 407 + sqrt(sq(150) - sq(xCor-300));
    } else if ( q == 0) {
      yCor = 407 - sqrt(sq(150) - sq(xCor-300));
    }
  }
}

void removeLast() {
  if (lastAdded.size() > 0) {
    lastAdded.remove( lastAdded.size() - 1);
  }
}