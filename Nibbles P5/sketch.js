var mySnake; 
var myFruit;


//START
function setup() {

  createCanvas(200, 200);
  
  mySnake = new Snake();
  myFruit = new Fruit();

}


//UPDATE
function draw() {

  background(0);
  
  myFruit.update(mySnake.vx,mySnake.vy);
  myFruit.show();
  
  mySnake.update(myFruit.collided);
  mySnake.show();
  
}

//INPUT
function keyPressed(){
  
  if(keyCode===UP_ARROW){
    mySnake.move(int(0),int(-1));
  }
  else if(keyCode===DOWN_ARROW){
    mySnake.move(int(0),int(1));
  }
  else if(keyCode===LEFT_ARROW){
    mySnake. move(int(-1),int(0));
  }
  else if(keyCode===RIGHT_ARROW){
    mySnake.move(int(1),int(0));
  }
  
}


//FRUIT
function Fruit(){
  this.x=int(50);
  this.y=int(180);
  this.collided=false;
  
  this.update=function(sx,sy){
        
        this.collided=false;
        
    if(int(this.x)==int(sx) && int(this.y)==int(sy)){
      
      this.x=int(random(0,20))*10;
      this.y=int(random(0,20))*10;
     
      this.collided=true;
    }
    
  }
  
  this.show=function(){
    
    fill("#f20");
    rect(this.x,this.y,10,10);
  
  }
  
}


//SNAKE
function Snake(){
  this.x=int(100);
  this.y=int(100);
  this.vx=int(0);
  this.vy=int(0);
  this.xspeed=int(1);
  this.yspeed=int(0);
  this.snakeArrayX = [];
  this.snakeArrayY = [];
  this.snakeLength=1;
 
  //make it impossible to turn 180 degree around
    this.move = function( sx , sy ){
      if(this.xspeed===0 && sx!=0){
          this.xspeed=sx;
          this.yspeed=sy;
        }
      if(this.yspeed===0 && sy!=0){
          this.xspeed=sx;
          this.yspeed=sy;
        }
    }
  
  this.update = function(fruitCollided){
  
    //add directional movement
    this.x+=this.xspeed+((this.snakeLength*0.1)*this.xspeed);
    this.y+=this.yspeed+((this.snakeLength*0.1)*this.yspeed);
  
    
    //collitions with fruit
      if(fruitCollided){
       this.snakeLength++;
       }
        
    //if snake touch border
    var outBorder=false;
    if(this.x<0 || this.y<0 ){
       outBorder=true;
      }
       if( this.x>200 || this.y>200){
         outBorder=true;
       }
    
       if(outBorder===true){
         
		 this.y=int(100);
         this.x=int(100);
         
         this.snakeLength=1;
       }
    
    //if snake touches self
    
      for(let i=2; i<this.snakeArrayX.length; i++){
        if(this.vx===this.snakeArrayX[i])
        {
          if(this.vy===this.snakeArrayY[i])
          {
			this.y=int(100);
			this.x=int(100);
    
            this.snakeLength=1;
          }
        }
      }
  
    
    //make snake body fallow
  
           if(this.snakeArrayX[0] != this.vx || 
              this.snakeArrayY[0] != this.vy){
      
      this.tempArrayX = [this.snakeLength];
      this.tempArrayY = [this.snakeLength];

       this.tempArrayX[0] = this.vx;
       this.tempArrayY[0] = this.vy;
    
      for(let i=0; i<this.snakeLength-1;i++){
        
        this.tempArrayX[i+1] = this.snakeArrayX[i];
        this.tempArrayY[i+1] = this.snakeArrayY[i];
      
      }
  
      this.snakeArrayX = this.tempArrayX;
      this.snakeArrayY = this.tempArrayY;
    }
    
    //moves snake by increments of 10px
    this.vx=this.x-this.x%10;
    this.vy=this.y-this.y%10;
  }
  
  
  this.show = function(){
  
    fill("#ff0"); 
    //print(this.y +" | "+this.vy)
    rect(this.vx,this.vy,10,10);
    
    if(this.snakeArrayX!=null || this.snakeArrayY!=null){
      for(let i=0; i<this.snakeArrayX.length;i++){
        rect(this.snakeArrayX[i],this.snakeArrayY[i],9,9);
      }
    }
  }
  

}