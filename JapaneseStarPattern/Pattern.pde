class Pattern{
  float hexSize;
  float triSize;
  
  PVector[] hexShapePos;
  PVector[] triShapePos;
  
  Hexa[] hexagons;
  Tri[] triangles;

  int cycle;

  Pattern(float _hexSize){
    
    cycle = 0; 
    
    hexSize = _hexSize;
    
    int rows = int((width/hexSize)+5);
    int cols = int((height/hexSize)+5);
    
    hexShapePos = new PVector[ rows * cols ];

    hexagons = new Hexa[ rows * cols ];
    triangles = new Tri[ rows * cols * 2 ];

    for(int i = 0 ; i<rows; i++){
      for(int j = 0 ; j<cols; j++){
        //vertical hexs
        hexShapePos[i*cols+j] = new PVector( i * sin((TWO_PI/6)*2) * hexSize - j%2 *sin((TWO_PI/6)*2) * hexSize/2 , j * (cos((TWO_PI/6)*5) * (hexSize*1.5)));
      }
    }
    
     for(int i = 0; i<hexShapePos.length; i++){
       hexagons[i] = new Hexa( hexSize/2 , hexShapePos[i] );
       triangles[i] = new Tri( hexSize/2 , hexShapePos[i], false ); 
       triangles[(hexShapePos.length-1)+i] = new Tri( hexSize/2 , new PVector( hexShapePos[i].x  - sin((TWO_PI/6)*2) * hexSize , hexShapePos[i].y + cos((TWO_PI/6)*4) * hexSize ), true);
     }

}
  
  void Show(){
    
    for(int i = 0; i<hexShapePos.length; i++){
        
        //hexagons[i].Show(0);//or with cycle var as an agument
        triangles[i].Show(cycle);//or with cycle var as an agument
        triangles[(hexShapePos.length-1)+i].Show(cycle);//or with cycle var as an agument
        
    }
  
    cycle++;
  }

}
