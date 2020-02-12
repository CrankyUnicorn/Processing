Cell[][] cellMatrix;
int cellSize;
int cols , rows;

void setup(){
  frameRate(30);
  size( 400, 400 );
  cellSize = 2;
  cols = width / cellSize;
  rows = height / cellSize;
  cellMatrix = new Cell[cols][rows];
  
  for(int y = 0 ; y < cols; y++){
    for(int x = 0 ; x < rows; x++){
      cellMatrix[x][y] = new Cell( random(0,1) , random(0,0.4) );
    }
  }
  
  
}

void Convolution(int absX, int absY){
  int nValues = 0;
  float aValues = 0;
  float bValues = 0;
  
  cellMatrix[absX][absY].RefreshValues();
  
  for(int offsetY = -1 ; offsetY < 2; offsetY++){
    for(int offsetX = -1 ; offsetX < 2; offsetX++){
      int targetCellX = absX+offsetX;
      int targetCellY = absY+offsetY;
      if( targetCellX >= 0 && targetCellX < cols ){
        if( targetCellY >= 0 && targetCellY < rows ){
          
          nValues++;
          
          if( offsetX == 0 && offsetY == 0){
            
            aValues += cellMatrix[targetCellX][targetCellY].GetA() * -1;
            bValues += cellMatrix[targetCellX][targetCellY].GetB() * -1;
          
          }else if ( offsetX == 0 || offsetY == 0){
            
            aValues += cellMatrix[targetCellX][targetCellY].GetA() * 0.2;
            bValues += cellMatrix[targetCellX][targetCellY].GetB() * 0.2;
          
          }else{
            
            aValues += cellMatrix[targetCellX][targetCellY].GetA() * 0.05;
            bValues += cellMatrix[targetCellX][targetCellY].GetB() * 0.05;
          
          }
        }    
      }
    }
  }
  
  cellMatrix[absX][absY].SendA( aValues );
  cellMatrix[absX][absY].SendB( bValues );
  
  cellMatrix[absX][absY].Calculate();
  
} 

void draw(){
 for(int y = 0 ; y < cols; y++){
    for(int x = 0 ; x < rows; x++){
      
      //convolution call
      if( x >= 1 && x < cols-1 ){
        if( y >= 1 && y < rows-1 ){
          
        }
      }
      Convolution( x , y );
      
      //display part
      //color c = color(125*cellMatrix[x][y].GetCalcA()+125,125,125*cellMatrix[x][y].GetCalcB()+125);
      color c = color( 255 , 255-250*cellMatrix[x][y].GetCalcB() , 255-180*cellMatrix[x][y].GetCalcB());
      
      fill(c);
      noStroke();
      rect(x*cellSize,y*cellSize,cellSize,cellSize);
    }
  }
}
