String textbox;
PFont f;

void setup(){
  size(500,500);
  f = createFont("Arial",16,true); // STEP 2 Create Font
}

void draw(){
  background(21,56,31);
  
  rectMode(CENTER);
  fill(255);
  rect(250,250,80,20);
  
  textFont(f,10);                  // STEP 3 Specify font to be used
  fill(0);  // STEP 4 Specify font color 
  textAlign(CENTER);
  text("Hello Strings!",250,250);   // STEP 5 Display Text
  
}

void keyPressed(){
  
}