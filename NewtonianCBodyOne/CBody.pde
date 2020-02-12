class CBody{
  boolean active;
  
  float posX;
  float posY;
  float mass;
  float dirX;
  float dirY;

  float radius;
  color c;
  color cTrail;
  
  boolean stationary;
  
  float[] trailX;
  float[] trailY;
  
  CBody(float _posX,float _posY, float _mass, boolean _follow){
    active = true;
    posX = _posX;
    posY = _posY;
    mass = _mass;
    
    trailX = new float[10];
    trailY = new float[10];
    
    if(true){
      //caos random start
      if(_follow == false){
        int factor = 100;
        dirX = random(-factor,factor);
        dirY = cos((dirX/factor)*2)*factor;
      }if(true){
         dirX = random(-50,50);
         dirY = random(-50,50);
      }else{
        dirX = 0;
        dirY = 0;
      }
    }else{
      //random inicial spin effect
      float distanceToCenter = abs(sqrt(sq(posX-width/2)+sq(posY-height/2))); 
      dirX += (-sin((posY-height/2)/distanceToCenter));
      dirY += (sin((posX-width/2)/distanceToCenter));
    }
    
    radius = (sqrt(mass)/PI)*10;// *10 just for visuals
    c = color(125,125,155);
    cTrail = color(125,125,155,50);
    
    stationary = _follow;
    
    Move();
    for(int i=trailX.length-1; i>0; i--){
      trailX[i] = posX;
      trailY[i] = posY;
    }
 
  }
  
  //CALCULATES Gravitic Influeces
  void Calculate(CBody other){
    
    if (other != null){
      if (other != this){
         
        float difX = other.posX - posX;
        float difY = other.posY - posY;
        float difMagnitude = abs(sqrt(difX*difX+difY*difY));
        float difXnormalised = difX/difMagnitude;
        float difYnormalised = difY/difMagnitude;
      
        float force = 0;
        
        // gravity formulae
        if(false){
          force = (G * other.mass * mass) / difMagnitude;
        }else if(false){
          force = (G * (other.mass / mass) )/ difMagnitude*mass;
        }else if(false){
          force = (G * (other.mass * mass)) / sqrt(difMagnitude);
        }else if(false){
          force = (G * other.mass) / sq(difMagnitude);  
        }else{
          force = (G * other.mass * mass) / sq(difMagnitude);
        }
        
        
        if(true){
          dirX = dirX+(difXnormalised*(sqrt(force/mass))*2);
          dirY = dirY+(difYnormalised*(sqrt(force/mass))*2);
        }else{
          dirX = dirX+(difXnormalised*force);
          dirY = dirY+(difYnormalised*force);
        
        }
        
        
        //Merge note that the other body is always smaller since its 
        //radius can not reach the larger body in this case this one 
        if(difMagnitude<= radius && other.active && mass>other.mass){
          other.active = false;
          
          mass += other.mass;
          //dirX = (other.dirX*other.mass-dirX*mass)/(other.mass*mass);
          //dirY = (other.dirY*other.mass-dirY*mass)/(other.mass*mass);
          dirX = (dirX *mass - other.dirX *other.mass)/((mass -other.mass));
          dirY = (dirY *mass - other.dirY *other.mass)/((mass -other.mass));
          
        }
      }
    }
  
  }
  
  
  //Moves Object
  void Move(){
   
    if(actualCycle%1==0){
    for(int i=trailX.length-1; i>0; i--){
      trailX[i] = trailX[i-1];
      trailY[i] = trailY[i-1];
    }
    
    trailX[0] = posX;
    trailY[0] = posY;
    }
    
    posX += dirX;
    posY += dirY;
    
  }
  
  //DRAWS OBJECT
  void Show(){
  
    for(int i = 0; i<trailX.length; i++){
      stroke(color(red(c),green(c),blue(c),100/(i+1)+(155/(i+1))/largestMass*mass));
      noFill();
      if(i!=0){
        line( (trailX[i-1]-offsetX)*zoom+width/2,
              (trailY[i-1]-offsetY)*zoom+height/2,
              (trailX[i]-offsetX)*zoom+width/2,
              (trailY[i]-offsetY)*zoom+height/2);
      }else{
        line( (posX-offsetX)*zoom+width/2,
              (posY-offsetY)*zoom+height/2,
              (trailX[i]-offsetX)*zoom+width/2,
              (trailY[i]-offsetY)*zoom+height/2);
      }  
  }
    
    radius = (sqrt(mass)/PI)*10;// *10 just for visuals
    fill(c);
    noStroke();
    ellipse((posX-offsetX)*zoom+width/2, (posY-offsetY)*zoom+height/2, radius*zoom, radius*zoom);
  }

}
