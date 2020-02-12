class CMass{

  float posX;
  float posY;
  
    color c;
  
  CMass(){
    c = color(255,125,155);
  }
 
 void PassInto(float x, float y){
 posX = x;
 posY = y;
 }
 
   void Show(){
    fill(c);
    noStroke();
    ellipse((posX-offsetX)*zoom+width/2, (posY-offsetY)*zoom+height/2, 3, 3);
  }
}
