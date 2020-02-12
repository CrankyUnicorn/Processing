int bodyCount;
CBody[] cBodies;
PVector offsetPos;


void setup(){
  fullScreen();
  frameRate(30);
  background(0);
  
  
  bodyCount = 500;
  cBodies = new CBody[bodyCount];
  
  offsetPos = new PVector( width/2 , height/2);
  
  for(int i = 0; i< cBodies.length; i++){
   
    cBodies[i] = new CBody( new PVector ( random( -width/2 , width/2  ), random( -width/2 , width/2 ) ),
                            new PVector(0,0) ,
                            4 ,
                            0);
  }
  
}

void draw(){
  //background(0);

  /* fill(120,50,150,125);
   noStroke();
   ellipse(0 + offsetPos.x , 0 + offsetPos.y , 5, 5);*/
  
  for(int i = 0; i< cBodies.length; i++){
    cBodies[i].calculate(new PVector(0,0));
    cBodies[i].show(offsetPos);
  }
  
  fill(0,0,0,1);
  noStroke();
  rect(0,0,width, height);
  //blend(0,0,width, height,0,0,width, height, EXCLUSION);
}
