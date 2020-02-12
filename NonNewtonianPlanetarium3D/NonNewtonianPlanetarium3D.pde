import peasy.*;

CBody Sun;
CBody Planets;
PeasyCam cam;
PImage[] textures;
int planetIndex;

void setup(){
//fullScreen(P3D); //throws exception erro because of back not being the same size as view
size(600,600,P3D);

textures = new PImage[6];
textures[0] = loadImage("milkyway.jpg");
textures[1] = loadImage("sun.jpg");
textures[2] = loadImage("venus.jpg");
textures[3] = loadImage("earth.jpg");
textures[4] = loadImage("ceres.jpg");
textures[5] = loadImage("mars.jpg");
//resize
textures[0].resize(600,600); 

cam = new PeasyCam(this, 300);

planetIndex = 0;

Sun = new CBody( 0 , 0 , 30 , 0, new PVector(0,0,0) );
Planets = new CBody( 0 , 0 , 29 , 5, new PVector(0,0,0) );

}

void draw(){
background(textures[0]);
//pointLight(255,255,255,0,0,0);
//translate( width/2 , height/2 ); //dont use this with peasycam 
Sun.Show();
 pointLight(255,255,255,0,0,0);
  planetIndex = 0;
Planets.Show();

}
