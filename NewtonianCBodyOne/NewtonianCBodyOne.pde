PFont f;

float G;
CBody[] cBodies;
CMass cMass;
int bodyCount;
float offsetX;
float offsetY;
float zoom;

float largestMass;
int currentTarget;

int actualCycle;

void setup()
{
  frameRate(60);
  
  f = createFont("Courier",16,false);
  
  fullScreen();
  //size(1200,700);
  
  G = 100;
  
  bodyCount = 1000;

  offsetX = 0;
  offsetY = 0;
  zoom = 0.02;
  
  largestMass = 0;
  
  actualCycle = 0;
  
  cMass = new CMass();
  
  cBodies = new CBody[bodyCount];
  
  cBodies[0] = new CBody(width/2, height/2, random(20, 30), true);
  
  for(int i = 1 ; i< bodyCount ; i++){
    int spredFactor = 3000;
    float startPosX  = random(-spredFactor, spredFactor);
    cBodies[i] = new CBody(startPosX, random(-cos((startPosX)/spredFactor)*spredFactor,cos((startPosX)/spredFactor)*spredFactor), random(1, 3), false);
  }
  

}

void keyPressed() {
  if(key == '+'){
    zoom = zoom + 0.001;
    if(zoom>1) zoom = 1;  
  }
  if(key == '-'){
    zoom = zoom - 0.001;
    if(zoom<0.001) zoom = 0.001;
  }
  

   

}

CBody[] PopOut (CBody[] _array, int index ){
  
  CBody[] _newArray = new CBody[ _array.length-1];
  
  int actualIndex=0;
  
  for(int  i = 0; i< _array.length; i++){
    if(i!=index){
      _newArray[actualIndex] = _array[i];
      actualIndex++;
    }
  }
  
  return _newArray;
}

void draw()
{
  background(50);
  
  //CLEAN Pops out incative bodies from  bodies array
    for(int j = cBodies.length-1 ; j>0 ; j--){
      if(!cBodies[j].active){        
        cBodies = PopOut(cBodies, j);
      }
    }
    
    //find body with largest mass
    largestMass = 0;
    for(int j = 0 ; j<cBodies.length ; j++){
      if(largestMass < cBodies[j].mass){
        largestMass = cBodies[j].mass;
        //Reasign Target
        currentTarget = j;
      } 
    }
  
  
   
  
  //FIND AVARAGE LOCATION ON XY OF Celestial Bodies
  float posXSum = 0;
  float posYSum = 0;
  float totalMass=0;
  
  for(int i = 0 ; i < cBodies.length ; i++){
  
    if(i==currentTarget){
      totalMass += cBodies[i].mass;
      posXSum += cBodies[i].posX*cBodies[i].mass;
      posYSum += cBodies[i].posY*cBodies[i].mass;  
    }else if(i!=currentTarget){
      float distanceRelation = cBodies[i].mass/abs(sqrt(sq(cBodies[i].posX-cBodies[currentTarget].posX)+sq(cBodies[i].posY-cBodies[currentTarget].posY))); 
      totalMass += distanceRelation;
      posXSum += cBodies[i].posX*distanceRelation;
      posYSum += cBodies[i].posY*distanceRelation;     
    }
  }
  
  //OFFSET
  if(true){
    offsetX = posXSum / totalMass;
    offsetY = posYSum / totalMass;
  }else{
    offsetX = cBodies[currentTarget].posX;
    offsetY = cBodies[currentTarget].posY;
  }
  //DRAW ALL ELEMENTS
  for(int i = 0 ; i<cBodies.length ; i++){
     
    
    for(int j = 0 ; j<cBodies.length ; j++){
    
      cBodies[i].Calculate(cBodies[j]);
    }
    
    if(false){
      //center of mass pin force
      float distance = abs(sqrt(sq(cBodies[i].posX-width/2)+sq(cBodies[i].posY-height/2))); 
      cBodies[i].dirX += (-sin((cBodies[i].posY-width/2)/distance))*0.01;
      cBodies[i].dirY += (sin((cBodies[i].posX-height/2)/distance))*0.01;
    }
    
    cBodies[i].Move();
    cBodies[i].Show();
  }
  
  cMass.PassInto(offsetX , offsetY);
  //cMass.Show();
  
  actualCycle++;
  textFont(f);
  fill(255);
  text("Cycles: "+ actualCycle +"\nLargest Mass: "+largestMass+"\nBody Count: "+cBodies.length,10,20);
  

}
