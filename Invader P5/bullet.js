function Bullet(){
  this.x = -10;
  this.y = -10;
  this.direction = 0;
  
  
  this.onShot= function(direction,origin){
    if(direction<0){
    
    this.x= origin[0]+10-3;
      this.y= origin[1]-10;
    } else{
      this.x= origin[0]+10-3;
      this.y= origin[1]+30;
    }
    
      this.direction=direction;
  }
  
  this.updateMovement= function(){
   if(this.y>-10 && this.y<height+10){
     this.y+=this.direction;
   }
  }

  this.show = function(){
    fill(255);
    noStroke();
    //ellipse(this.x,this.y,6,6);
    rect(this.x,this.y,6,6);
  }
}