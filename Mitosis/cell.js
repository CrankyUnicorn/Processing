function Cell(valueX,valueY, valueR, valueC,valueGen){

  this.x = valueX;
  this.y = valueY;
  this.r = valueR+random(-1,1);
  this.c = valueC;
  this.d = [random(-1.1,1),random(-1.1,1)];
  this.l = 0;
  this.gen=valueGen;
  
  this.divide = function(){
 
  
  //NEW CELL
    this.directionX = 1;
    this.directionY = 1;
    
    if(1>random(0,2)){
      this.directionX = -1; 
    }
    if(1>random(0,2)){
      this.directionY = -1;
    }
    
    this.newX= int(sin(random(PI*2))*this.r/2+this.x);
    this.newY= int(cos(random(PI*2))*this.r/2+this.y);
    this.newR = this.r/2;
    this.newGen = this.gen+1;
    this.newC = [random(125-this.newGen,255-this.newGen),random(125-this.newGen,255-this.newGen),random(125-this.newGen,255-this.newGen)];
    this.newCell = new Cell(this.newX,this.newY,this.newR,this.newC,this.newGen);
    
     //ACTUAL CELL
  this.r=this.r/2;
    
    //return
    return this.newCell;
  }
  
  //GROW
  this.grow = function(){
    this.l++;
    if(this.l>this.r){
      this.l=0;
      this.r+=0.1;
    }
    
    
  
  }

  //MOVE
  this.move = function(){
    this.d[0] += random(-0.11,0.1);
    this.d[1] += random(-0.11,0.1);
    this.newX = cos(this.d[1]);
    this.newY = sin(this.d[0]);
    this.x += this.newX;
    this.y += this.newY;
    this.x = constrain(this.x,0+this.r,width-this.r);
    this.y = constrain(this.y,0+this.r,height-this.r);
    
  }
  
  //SHOW
  this.show = function(){
    fill(this.c[0],this.c[1],this.c[2]);
    noStroke();
    ellipse(this.x,this.y,this.r,this.r);
  }
  
}