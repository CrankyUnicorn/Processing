class Tri{

  float radius;
  PVector pos;
  boolean inverted;
  color color1;
  color color2;
  color color3;
  int seed1;
  int seed2;
  int seed3;
  
  Tri(float _radius, PVector _pos, boolean _inverted){
  
    radius = _radius;
    pos = _pos;
    inverted = _inverted;
    color1 = color(125);
    color2 = color(125);
    color3 = color(125);
    seed1 = int(random(0,90));
    seed2 = int(random(0,90));
    seed3 = int(random(0,90));
    
  }
  
  
  void Show(int _cycle){
    
    PVector a1 ,a2 ,a3, b1, b2, b3, c1, c2, c3 ;
    
     if(inverted){
    
        a1 = new PVector( pos.x + sin((TWO_PI/6)*4)*(radius/20) , pos.y + cos((TWO_PI/6)*4)*(radius/20));
        a2 = new PVector( a1.x + sin((TWO_PI/6)*3)*((radius/10)*8)  , a1.y + cos((TWO_PI/6)*3)*((radius/10)*8) );
        a3 = new PVector( a1.x + sin((TWO_PI/6)*5)*((radius/10)*8) , a1.y + cos((TWO_PI/6)*5)*((radius/10)*8));
    
        b1 = new PVector( pos.x + sin((TWO_PI/6)*0)*(radius/20) , pos.y + cos((TWO_PI/6)*0)*(radius/20) );
        b2 = new PVector( b1.x + sin((TWO_PI/6)*5)*((radius/10)*8) , b1.y + cos((TWO_PI/6)*5)*((radius/10)*8));
        b3 = new PVector( b1.x + sin((TWO_PI/6)*1)*((radius/10)*8) , b1.y + cos((TWO_PI/6)*1)*((radius/10)*8) );
    
        c1 = new PVector( pos.x + sin((TWO_PI/6)*2)*(radius/20) , pos.y + cos((TWO_PI/6)*2)*(radius/20) );
        c2 = new PVector( c1.x + sin((TWO_PI/6)*1)*((radius/10)*8) , c1.y + cos((TWO_PI/6)*1)*((radius/10)*8) );
        c3 = new PVector( c1.x + sin((TWO_PI/6)*3)*((radius/10)*8) , c1.y + cos((TWO_PI/6)*3)*((radius/10)*8) );
     }else{
    
        a1 = new PVector( pos.x + sin((TWO_PI/6)*1)*(radius/20) , pos.y + cos((TWO_PI/6)*1)*(radius/20));
        a2 = new PVector( a1.x + sin((TWO_PI/6)*0)*((radius/10)*8) , a1.y + cos((TWO_PI/6)*0)*((radius/10)*8) );
        a3 = new PVector( a1.x + sin((TWO_PI/6)*2)*((radius/10)*8) , a1.y + cos((TWO_PI/6)*2)*((radius/10)*8) );
    
        b1 = new PVector( pos.x + sin((TWO_PI/6)*3)*(radius/20) , pos.y + cos((TWO_PI/6)*3)*(radius/20) );
        b2 = new PVector( b1.x + sin((TWO_PI/6)*2)*((radius/10)*8) , b1.y + cos((TWO_PI/6)*2)*((radius/10)*8));
        b3 = new PVector( b1.x + sin((TWO_PI/6)*4)*((radius/10)*8) , b1.y + cos((TWO_PI/6)*4)*((radius/10)*8) );
    
        c1 = new PVector( pos.x + sin((TWO_PI/6)*5)*(radius/20) , pos.y + cos((TWO_PI/6)*5)*(radius/20) );
        c2 = new PVector( c1.x + sin((TWO_PI/6)*4)*((radius/10)*8)  , c1.y + cos((TWO_PI/6)*4)*((radius/10)*8) );
        c3 = new PVector( c1.x + sin((TWO_PI/6)*0)*((radius/10)*8) , c1.y + cos((TWO_PI/6)*0)*((radius/10)*8));
     }

    if(_cycle%90==seed1)
    color1 = color((red(color2)+random( -3 , +5 ))%130+125 , (green(color2)+random( -3 , +5 ))%130+125 , (blue(color2)+random( -3 , +5 ))%130+125);
    fill(color1);
    
    triangle( a1.x , a1.y , a2.x , a2.y , a3.x , a3.y );
    
    if(_cycle%90==seed2)
    color2 = color( (red(color3)+random( -3 , +5 ))%130+125 , (green(color3)+random( -3 , +5 ))%130+125 , (blue(color3)+random( -3 , +5 ))%130+125);
    fill(color2);
    
    triangle( b1.x , b1.y , b2.x , b2.y , b3.x , b3.y );
    
    if(_cycle%90==seed3)
    color3 = color( (red(color1)+random( -3 , +5 ))%130+125 , (green(color1)+random( -3 , +5 ))%130+125 , (blue(color1)+random( -3 , +5 ))%130+125);
    fill(color3);
    
    triangle( c1.x , c1.y , c2.x , c2.y , c3.x , c3.y );
  
  }
}
