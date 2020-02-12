function AlienShip(){
  this.x=width/2;
  this.y=10;
  this.shipwidth=20;
  this.shipheight=20;
this.timeCounter=0;
  this.seedx= random(0,100);
  this.seedy= random(0,100);
  this.dead=false;
  
this.move = function(){
if(this.dead!=true){  
  this.timeCounter++;
  this.x+=sin(this.timeCounter/50);
  this.x+=sin((this.timeCounter+this.seedx)/5);
  this.y+=sin((this.timeCounter+this.seedy)/5);
  if(this.timeCounter%10===0){
    this.y++;
  }
  }
  
  if(this.dead){
    this.x= -100;
    this.y= -100;
  }
}
   
   this.show = function(){
    fill(0,255,0);
    noStroke();
    rect(this.x,this.y,20,20)
  }
}