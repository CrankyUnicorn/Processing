class Star{
  float x;
  float y;
  float z;
  
  Star(){

  x = random(-20,width/2-10)+random(20,width/2+10);
  y = random(-20,height/2-10)+random(20,height/2+10);
  z = random(1,100);
  
  }
  
  void update(){
       z++;
   
  }
    
  void show(){
    fill(255);
    noStroke();
    float posX = width/2+((x-(width/2))*z/100);
    float posY = height/2+((y-(height/2))*z/100);
    float size = (z/100)*2;
    ellipse(posX,posY,size,size);
    
        if(posX<-width ||posX>width*2 || posY<-height ||posY>height*2 ){
           x = random(0,width/2-10)+random(20,width/2+10);
           y = random(0,height/2-10)+random(20,height/2+10);
           z=1;
        }    
  }
}
