import peasy.*;

PeasyCam cam;

float x, y, z;
float sigma, phi, beta;
PVector[] path;

void setup(){
  size( 600 , 600 , P3D );
  frameRate(30);
  cam = new PeasyCam(this , 100);
  
  colorMode(HSB);

  
  x = 0.1;
  y = 0;
  z = 0;
  sigma  = 10; 
  phi = 28;
  beta = 8.0/3.0;

  path = new PVector[10000000];
}

void draw(){
  translate(width/2, height/2);
  background(0);
 
  

  
  float dt = 0.01;
  float dx = ( sigma*(y-x) ) * dt;
  float dy = ( x*(phi-z)-y ) * dt;
  float dz = ( x*y-beta*z ) * dt;
  y += dy;
  x += dx;
  z += dz;
  
  println("x: " + x + " y: " + y + " z: " + z);
  
  for(int i = 0; i< path.length ; i++){
    if(path[i]!=null){
      if( i != 0 ){
        color c = color((i*0.1)%255,255,255);
        stroke(c);
        line( path[i-1].x*10, path[i-1].y*10, path[i-1].z*10,
              path[i].x*10, path[i].y*10, path[i].z*10);
      }
    }else{
      path[i] = new PVector(x,y,z);
      break;
    }
  }
}
