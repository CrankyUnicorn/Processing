class CBody{
PVector pos;
PVector absolutePos;
PVector preAbsoulutePos;

float angle;
float radius;
float distance;
int remaining;
PVector parentPos;



CBody childCbody;

  CBody( float _distance, float _angle, float _radius, int _remaining, PVector _parentPos){
    pos = new PVector(0,0);
    absolutePos = new PVector(0,0);
    preAbsoulutePos = new PVector(0,0);
    angle = _angle;
    radius = _radius;
    distance = _distance;
    remaining = _remaining - 1;
    
    parentPos = _parentPos;
    
    if(remaining>0){
      childCbody= new CBody( radius*1.1 , random( 0 , PI ) , radius*0.9, remaining , absolutePos );
    }
    
  }
  

  
  void Show(){
    if(remaining == 0){
      fill(255, 125);
      stroke(cycles+(255/3*2) % 255, cycles+(255/3) % 255, cycles % 255);
    }else{
      fill(255, 0);
      noStroke();
    }
  
    pos.x = cos(angle) * distance;
    pos.y = sin(angle) * distance;
    absolutePos.x = parentPos.x + pos.x;
    absolutePos.y = parentPos.y + pos.y;
    if(remaining == 0){
      line(absolutePos.x, absolutePos.y ,preAbsoulutePos.x, preAbsoulutePos.y);
      preAbsoulutePos = absolutePos.copy();
    }else{
      ellipse(absolutePos.x, absolutePos.y , radius , radius);
    }
    
    if(childCbody!=null){
        childCbody.Show();
    }
    
     angle +=  4*PI/((distance+1)-(remaining+1))*(cycles%5);
 
    
  
  }

}
