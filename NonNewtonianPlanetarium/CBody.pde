class CBody{
PVector pos;
PVector absolutePos;
float angle;
float radius;
float distance;
int remaining;
PVector parentPos;

CBody[] childCbodies;

  CBody( float _distance, float _angle, float _radius, int _remaining, PVector _parentPos){
    pos = new PVector(0,0);
    absolutePos = new PVector(0,0);
    angle = _angle;
    radius = _radius;
    distance = _distance;
    remaining = _remaining-1;
    
    parentPos = _parentPos;
    
    Show();
    
    childCbodies = new CBody[int(random(remaining/2,remaining))];
    
    for(int i = 0 ; i < childCbodies.length; i++ ){
      
      childCbodies[i] = new CBody( (i+1)*pow(remaining,3) , random( 0 , PI ) , radius , remaining , absolutePos );
    }
    
    //recalculates the radius based on distance
    if(pos.mag()!=0)
    radius = (radius*pos.mag()*remaining)/(width*2);
    
  }
  

  
  void Show(){
    fill(255, 200);
    noStroke();
    pos.x = cos(angle) * distance;
    pos.y = sin(angle) * distance;
    absolutePos.x = parentPos.x + pos.x;
    absolutePos.y = parentPos.y + pos.y;
    ellipse(absolutePos.x, absolutePos.y , radius , radius);
  
    if(childCbodies!=null){
      for(int i = 0 ; i < childCbodies.length; i++ ){
        childCbodies[i].Show();
      }
    }
    
     angle += 1/(distance+1);
     //print(angle+ " | ");
  
  }

}
