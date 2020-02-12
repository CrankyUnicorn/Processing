import peasy.*;

int cols, rows, w, h, d;
PVector[][] landscape;
PeasyCam cam;
float translateNoise;

void setup(){
size(600,400,P3D);
cam = new PeasyCam(this, 100);
d = 20;
w = 1200;
h = 1200;
cols = w/d;
rows = h/d;
translateNoise = 0;

landscape = new PVector[cols][rows];//x and y 


for(int y = 0 ; y < rows ; y++){
    for(int x = 0 ; x < cols ; x++){
      if( y == 0 ){
        landscape[x][y] = new PVector(x*d, y*d, 0);
      }else if (y == rows -1 ){
        landscape[x][y] = new PVector(x*d, y*d, 0);
      }else if (x == 0 ){
        landscape[x][y] = new PVector(x*d, y*d, 0);
      }else if (x == cols -1 ){
        landscape[x][y] = new PVector(x*d, y*d, 0);
      }else{
        landscape[x][y] = new PVector(x*d, y*d, noise( x*0.1 , y*0.1+translateNoise)*d*10 );
      }
    }
  }
}

void draw(){
  translate(width/2, height);
  rotateX(PI/3);
  translate(-w*0.8,-h*1.2);
  
  background(100);
  if(true){
    lights();
    fill(200);
    noStroke();
 }else{
    noFill();
    stroke(255);
  }
  
 translateNoise-=0.02;
 
  for(int y = 0 ; y < rows-1 ; y++){
      fill( 255 - 255 * sin((PI*((y-(rows/3)))/rows-(rows/3))),
            255 - 255 * sin((PI*((y))/rows)),
            255 - 255 * sin((PI*((y+(rows/3)))/rows+(rows/3))));
      //fill(255/rows*y);
    beginShape(TRIANGLE_STRIP);
    for(int x = 0 ; x < cols ; x++){   
      vertex( landscape[x][y].x,landscape[x][y].y,landscape[x][y].z);
      vertex( landscape[x][y+1].x,landscape[x][y+1].y,landscape[x][y+1].z);
      
      if( y == 0 ){
         landscape[x][y].z = 0;
      
      }else if (y == rows -1 ){
         landscape[x][y].z = 0;
      
      }else if (x == 0 ){
         landscape[x][y].z = 0;
      
      }else if (x == cols -1 ){
         landscape[x][y].z = 0;
      
      }else{
        landscape[x][y].z = noise( x*0.1 , y*0.1+translateNoise)*d*10;
      }
    }
    endShape();  
  }
  
}
