function Ship(){
  this.shipwidth=20;
  this.shipheight=20;
  this.x=width/2;
  this.y=height-this.shipheight-10;
  this.xforce=0;

this.move = function(xmove){
  this.xforce+=xmove;
  
  if(this.x<this.shipwidth){
    this.x=this.shipwidth;
  }else if(this.x>width- this.shipwidth){
    this.x=width- this.shipwidth;
  }
}

  this.shot = function(){
  this.pos = [this.x,this.y]; 
    return this.pos;
  }
  
   this.show = function(){
    this.x+=this.xforce;
    this.xforce*=0.9;
    fill(255,255,0);
    noStroke();
    rect(this.x,this.y,this.shipwidth,this.shipheight)
  }
}