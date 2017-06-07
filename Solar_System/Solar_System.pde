int numStars; //Can't be greater than 5
Button test;

ArrayList<CelestialObject> lastAdded;

//ArrayList lastAdded = new Arraylist();

void setup(){
  size(600, 700);
  test = new Button();
  test.setup();
  lastAdded = new ArrayList();
  
    
  Star sun = new Star(300, 300);
  lastAdded.add(sun);
}

void draw(){
  test.draw();
  for(CelestialObject e:lastAdded){
        e.draw();
    }

}

void clear(){
  lastAdded = new ArrayList();
}

void removeLast(){
 lastAdded.remove( lastAdded.size() -1); 
}