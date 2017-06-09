float r = 100; //
float xCenter = 250;
float yCenter = 250;
float changeX = 1;
float q = 0;
float x = xCenter - r;
float y = yCenter;

void setup(){
  size(500,500);
  background(5,100,110);
}

void draw(){
  ellipse(x, y, 25, 25);
  
  if( x > xCenter +r){
    q = 1;
    changeX = -1;
  } else if(x < xCenter-r){
    q = 0;
    changeX = 1;
  }
  x += changeX; 
  
  if( q == 1){
    y = yCenter + sqrt(sq(r) - sq(x-xCenter)); //increase
  } else if( q == 0){
    y = yCenter - sqrt(sq(r) - sq(x-xCenter)); //increase
  }
  
}