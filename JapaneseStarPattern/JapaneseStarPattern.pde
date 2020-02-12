Pattern pattern;

void setup(){
  fullScreen();
  //size(600,600);
  frameRate(30);
  pattern = new Pattern(100);
}

void draw(){
  background(255);
  fill(0);
  stroke(255);
  //translate(width/2,height/2);

  pattern.Show();
}
