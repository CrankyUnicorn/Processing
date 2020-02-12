CBody Sun;
int cycles;


void setup(){
frameRate(300);
fullScreen();
background(0);
cycles = 0;
Sun = new CBody( 0 , 0 , 200 , 3 , new PVector(0,0) );
}

void draw(){
//background(0);
  cycles++;
  
  if(cycles % 3 == 0){
    fill(0,10);
    noStroke();
    rect(0,0,width,height);
  }
  
    if(cycles % 30 == 0){
    fill(0,50);
    noStroke();
    rect(0,0,width,height);
  }

  translate( width/2 , height/2 );
  Sun.Show();
  cycles++;
  Sun.Show();

}
