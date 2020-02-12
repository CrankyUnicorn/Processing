class Hexa{

  float radius;
  PVector pos;
  color c;
  
  
  Hexa(float _radius, PVector _pos){
  
    radius = _radius;
    pos = _pos;
    c = color(random(125,150),random(125,150),random(125,150));
  }
  
  
  void Show(int _cycle){
    if(_cycle%3==0)
    c = color( (red(c)+random( -4 , +5 ))%130+125 , (green(c)+random( -4 , +5 ))%130+125 , (blue(c)+random( -4 , +5 ))%130+125);
    fill(c);
    beginShape();
    vertex( pos.x + sin(0) * radius , pos.y + cos(0) * radius );
    vertex( pos.x + sin((TWO_PI/6)*1) * radius , pos.y + cos((TWO_PI/6)*1) * radius );
    vertex( pos.x + sin((TWO_PI/6)*2) * radius , pos.y + cos((TWO_PI/6)*2) * radius );
    vertex( pos.x + sin((TWO_PI/6)*3) * radius , pos.y + cos((TWO_PI/6)*3) * radius );
    vertex( pos.x + sin((TWO_PI/6)*4) * radius , pos.y + cos((TWO_PI/6)*4) * radius );
    vertex( pos.x + sin((TWO_PI/6)*5) * radius , pos.y + cos((TWO_PI/6)*5) * radius );
    endShape();
  
  }

}
