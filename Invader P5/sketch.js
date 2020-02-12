var myShip;
var myBullets;
var myAlienShips;
var myCurrentBullet;
var timer;

var maxAlienShipN;
var maxBulletsN;

function setup() {
  createCanvas(600, 400);
  maxAlienShipN=15;
  maxBulletsN=30;
  Restart();
  
}

function draw() {
  background(50);
  
   if(keyIsDown(LEFT_ARROW)){
    myShip.move(-1);
  }
  if(keyIsDown(RIGHT_ARROW)){
    myShip.move(1);
  }
  
  enemyShoot();
  checkCollitions()
  
  
  myShip.show();
  
    for(let i = 0 ; i< maxBulletsN; i++){
      
      myBullets[i].updateMovement();
      myBullets[i].show();
  }
  
  for(let i = 0 ; i< maxAlienShipN; i++){
    myAlienShips[i].move();
    myAlienShips[i].show();
  }
  
  timer++;
}

//
function enemyShoot(){
  for(let j = 0 ; j< maxAlienShipN; j++){
    if(random(0,1000)<1){
      this.alienShot=[myAlienShips[j].x,myAlienShips[j].y];       myBullets[myCurrentBullet].onShot(+1,alienShot);
      myCurrentBullet++;
      if(myCurrentBullet>=maxBulletsN) myCurrentBullet=0;
    }
  }
}

//
function checkCollitions(){
  this.dx;
  this.dy;
  
  for(let i = 0 ; i< maxBulletsN; i++){
    this.dx=abs(abs(myBullets[i].x-3)-abs(myShip.x+10));
    this.dy=abs(abs(myBullets[i].y-3)-abs(myShip.y+10));
    if(this.dx<10 && this.dy<10 ){
      print("collition w Ship detected")
      Restart();

    }

    
    for(let j = 0 ; j< maxAlienShipN; j++){
      this.dx=abs(abs(myBullets[i].x-3)-abs(myAlienShips[j].x+10));
      this.dy=abs(abs(myBullets[i].y+-3)-abs(myAlienShips[j].y+10));
      if(this.dx<10 && this.dy<10 && myBullets[i].direction < 0){
        print("bullet collition w Alien detected")
        myAlienShips[j].dead = true;
        myBullets[i].direction = 0;
        myBullets[i].x = -10;
        myBullets[i].y = -10;
      }
    }  
  }
  
  this.alldead=true;
  
  for(let j = 0 ; j< maxAlienShipN; j++){
      this.dx=abs(abs(myShip.x+10)-abs(myAlienShips[j].x+10));
      this.dy=abs(abs(myShip.y+10)-abs(myAlienShips[j].y+10));
    
    
      if(this.dx<10 && this.dy<10 ){
        print("collition b Ship n Alien detected")
        
        Restart();
      }
    
    if( myAlienShips[j].y > height-10){
        print("The Aliens have landed.")
        
        Restart();
      }
    
    if( myAlienShips[j].dead!=true){
        this.alldead=false;
      }
    }
  
    if( this.alldead==true){
        Restart();
      }
}

function Restart(){
  myShip = new Ship();
  myBullets =  [maxBulletsN];
  myAlienShips =  [maxAlienShipN];
  myCurrentBullet = 0;
  timer=0;
  
  for(let i = 0 ; i< maxBulletsN; i++){
    myBullets[i] = new Bullet();
  }
  
  for(let i = 0 ; i< maxAlienShipN; i++){
    myAlienShips[i] = new AlienShip();
    myAlienShips[i].x = width/12*(2*(i%5)+1);
    myAlienShips[i].y = 200/6*(2*(i%3)+1);
  }
    
}

function keyPressed(){
  if(keyCode===32){
   if(timer>60){
    myBullets[myCurrentBullet].onShot(-5,myShip.shot());
    myCurrentBullet++;
    if(myCurrentBullet>= maxBulletsN) myCurrentBullet=0;
    timer=0;
   }
   
 }
  
}
