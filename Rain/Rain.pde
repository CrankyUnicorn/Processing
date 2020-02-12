//(138,43,226)
//(230,230,250) bg

Drop[] droplets;
int dropsCount;

void setup()
{
  
  size(400,600);
  frameRate(30);
  dropsCount=1000;
  droplets = new Drop[dropsCount];
  for(int i =0; i<dropsCount;i++){
    droplets[i]= new Drop(); 
  }
}

void draw()
{
  background(230,230,250);

  for(Drop drop : droplets){
    drop.showIt();
    
  }
}

class Drop{
  int x;
  float y;
  int z;

 Drop(){
    x = (int)random(0,width);
    y = random(0,height);
    z = (int)sqrt(random(1,sqrt(random(9,100))));
  }
  
  void showIt(){
        
    y=y+(z *y/30);
    
    if(y>height*2){
      x = (int)random(0,width);
      y = random(0,height);
      z = (int)sqrt(random(1,sqrt(random(9,100))));
    }
    int transpB = (int)((100/height*3)*y);
    fill(198,93,255,55+10*z+transpB);
    noStroke();
    
    rect( x, (int)(y-height),(int)(z),(int)(z *y/30) );
    
    
    fill(245,240,255,150+10*z);
    noStroke();
    
    rect( x-1, (int)(y-height),(int)sqrt(z+4),(int)(z *y/30)-10 );
   }

}
