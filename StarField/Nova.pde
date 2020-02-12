class Nova{
  float x;
  float y;
  float z;
  float radius;
  float centerX;
  float centerY;
  float starSize;
  float[][] previousPoints = new float[2][10];
  int actualPointInArray;
  
  Nova(){
    centerX = width/2;
    centerY = height/2;
    radius = sq(2);    
    
    float selectRandomAxisInXY = random(-1,1);
    if(selectRandomAxisInXY<0){
      
      float randomNumber=random(-1, 1);
      x = centerX + randomNumber;
      radius = radius-abs(randomNumber);
      y = centerY + random(-radius, radius);
    
  }else{
      
      float randomNumber=random(-1, 1);
      y = centerY + randomNumber;
      radius = radius-abs(randomNumber);
      x = centerX + random(-radius, radius);
    
    }
    starSize = random(0,1);
  }
  
  void update(){
    float difX = x-centerX;
    float difY = y-centerY;
    float distance = sq(abs(difX)*abs(difX)+abs(difY)*abs(difY));
    x += difX/100;
    y += difY/100;
    
    starSize=sq(abs(difX)*abs(difX)+abs(difY)*abs(difY))/sq((centerX-1)*(centerY-1));
    
    if(x<0 || x>width){
     radius = sq(2);    
    float randomNumber=random(-1, 1);
    y = centerY + randomNumber;
    radius = radius-abs(randomNumber);
    x = centerX + random(-radius, radius);
    }
    
    if(y<0 || y>height){
    radius = sq(2);    
    float randomNumber=random(-1, 1);
    x = centerX + randomNumber;
    radius = radius-abs(randomNumber);
    y = centerY + random(-radius, radius);
     }
       
    previousPoints[0][actualPointInArray]=x;
    previousPoints[1][actualPointInArray]=y;
    
    actualPointInArray=actualPointInArray%9;
    actualPointInArray++;
        
  }
    
  void show(){
    fill(255);
    noStroke();
    for(int i=0;i<10;i++){
      float pX = previousPoints[0][i];
      float pY = previousPoints[1][i];
      ellipse(pX,pY,1,1);
    }
    ellipse(x,y,starSize,starSize);
  }
}
