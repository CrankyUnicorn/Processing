class CBody{
PVector pos;
PVector dir;
PVector parent;

int bodyCount;
CBody[] cBodies;

int generation;

int cycle;

  
  //CONSTRUCT
  CBody(PVector _pos, PVector _parent , int childNumber, int _gen){
    
    pos = _pos;
    dir = new PVector(0,0);
    parent = _parent;
    generation = _gen+1;
    cycle = 0;
       
    bodyCount = int( random( 0 , childNumber ) );
    cBodies = new CBody[bodyCount];
    
    
    for(int i = 0; i< cBodies.length; i++){
      /*cBodies[i] = new CBody( new PVector ( random( pos.x-20*i /generation, pos.x+20*i /generation ), random( pos.y-20*i /generation, pos.y+20*i /generation) ),
                              pos ,
                              bodyCount ,
                              generation);*/
                              
       cBodies[i] = new CBody( new PVector ( random( -20*i /generation, +20*i /generation ), random( -20*i /generation, +20*i /generation) ),
                              pos ,
                              bodyCount ,
                              generation);                         
    }
    
  }
  
  //CALC
  void calculate(PVector _pos){
  
    
    dir.x = sin( pos.y / pos.mag()*2 )*1.5;
    dir.y = -sin( pos.x / pos.mag()*2 )*1.5; 

   //dir.x = sin( pos.y / pos.mag() ); //circular orbit but a bit outward spirally 
   //dir.y = -sin( pos.x / pos.mag() ); //circular orbit but a bit outward spirally 

    
    pos.x += dir.x;
    pos.y += dir.y;
    
  
  }
  
  //SHOW
  void show(PVector _offset){
    
    int cycleLimiter = 5000;
    
    cycle++;
    if(cycle > cycleLimiter){
      cycle = 0;
    }
    
    PVector tempPos = pos.copy();
    tempPos.y = pos.y ;
    tempPos.x = pos.x ;
    
    //tempPos.y = pos.y * ((sin(cycle%15)+20)/21);
    //tempPos.x = pos.x * ((sin(cycle%15)+20)/21);
    PVector adjustedPos = PVector.add( _offset , tempPos );
    
 if(true){
      if(cycle<cycleLimiter/2){
        fill(random(160,200), random(100,130), random(200,250), 125/generation);
      }else{
        fill(random(0,30), random(0,10), random(30,50), 125/generation);
      }
      noStroke();
      ellipse(adjustedPos.x , 
             adjustedPos.y  , 
             bodyCount + 1 / (generation),
             bodyCount + 1 / (generation) );
             
      /*ellipse(adjustedPos.x , 
             adjustedPos.y , 
             bodyCount + 1 / (generation),
             bodyCount + 1 / (generation) );*/
             
    }else{
      stroke(120, 50, 150, 125/generation);
      noFill();
      line(adjustedPos.x , 
           adjustedPos.y , 
           adjustedPos.x + dir.x*10 , 
           adjustedPos.y + dir.y*10 );
    }
              
              
    
      if(cycle<cycleLimiter/2){
        stroke(120, 50, 150, 30*(generation-1));
      }else{
        stroke(30, 20, 50, 30*(generation-1));
      }
      noFill();
      line(adjustedPos.x , 
           adjustedPos.y , 
           _offset.x , 
           _offset.y );
              
              
    for(int i = 0; i< cBodies.length; i++){
     
      cBodies[i].calculate(pos);
      cBodies[i].show(adjustedPos);
    }
    
  }

}
