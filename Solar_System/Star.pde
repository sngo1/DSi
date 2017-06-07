class Star implements CelestialObject{
  
  double radius;
  double scaledRadius;
  double speed;
  double scaledSpeed;
  double xCor;
  double yCor;
  double mass;
  int type; //0 = 
  
  color c;
  
  Star(int x, int y){
    xCor = x;
    yCor = y;
    scaledRadius = 25;//NOT ACTUALLY TO SCALE
    
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r , g , b );
    
  }
  
  void add(){
    xCor = getXCor();
    yCor = getYCor();
  }
  
  void draw(){
    ellipse ( (float)xCor, (float)yCor, (float) ( 2 * scaledRadius ), (float)( 2 * scaledRadius ) );
    fill(c);
  }
  
  boolean Move(){
    return true;
  }
  
  double getXCor(){
    return xCor;
  }
  
  double getYCor(){
    return yCor;
  }
  
  int objectType(){
   return 0; 
  }
}