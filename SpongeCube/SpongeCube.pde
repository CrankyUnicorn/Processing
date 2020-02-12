float a;
Box myBox;

void setup()
{
  size(400,400,P3D);
  myBox= new Box(0,0,0,200,3);
  myBox.Generate();
}

void draw()
{
  background(0);
  noStroke();
  noFill();
  lights();
  translate(width/2, height/2);
  a+=0.01;
  rotateX(a);
  rotateY(a);
  
  myBox.show();
 
}
