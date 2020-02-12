class Box
{
  PVector pos;
  float radius;
  int reclusion;
  Box[] boxesInBox;
  boolean[] noHoles;

  Box(float x , float y , float z , float _radius, int _reclusion)
  {
    pos = new PVector(x,y,z);
    radius = _radius;
    reclusion = _reclusion;
    noHoles = new boolean[]{true,true,true,
                            true,false,true,
                            true,true,true,
                            
                            true,false,true,
                            false,false,false,
                            true,false,true,
                            
                            true,true,true,
                            true,false,true,
                            true,true,true,};
    boxesInBox = new Box[27];
    Generate();
  }
  
  void Generate()
  {
    if(reclusion>0){
      int actualIndex = 0;
      for(int x = -1; x<2; x++)
      {
        for(int y = -1; y<2; y++)
        {
          for(int z = -1; z<2; z++)
          {
            
            
              //if(noHoles[actualIndex])
              if(abs(x)+abs(y)+abs(z)>1)
              {          
                Box _box = new Box(  pos.x+CalculatePosition(x),
                                     pos.y+CalculatePosition(y),
                                     pos.z+CalculatePosition(z),
                                     radius/3,
                                     reclusion-1);
                boxesInBox[actualIndex] = _box;        
              }
            
            
            actualIndex++;
            //print("|"+actualIndex);
           }
        }
      }
    }
  }
 
  //
  float CalculatePosition(int axisCoord)
  {  //print("|"+axisCoord*(radius/2-(radius/6)));
    return axisCoord*(radius/2-(radius/6));
  }
  
  //
  void show(){
    //print(" || x:"+pos.x+" | y:" +pos.y+" | z:" +pos.z);
    pushMatrix();
    
    if(reclusion==0)
    {
      noStroke();
      fill(200,150,100);
    }else{
      noStroke();
      noFill();
    }
    
    translate(pos.x, pos.y, pos.z);
    
    box(radius);
    popMatrix();
    
    for(int i = 0; i<27; i++)
    {
       if(boxesInBox[i]!=null)
      boxesInBox[i].show();
    }
  }
}
