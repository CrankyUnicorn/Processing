float cellSize;
int cols;
int rows;

Cell[][] matrix;
PVector[] path;
int pIndex;

color c;


void setup(){
  frameRate(300);
  //size(400,400);
  fullScreen();
  
   Restart();
}


void Restart(){
  c = color( random( 0,125 ) + 100 , random( 0,125 ) + 100 , random( 0,125 ) + 100 );
  
  cellSize = 40;
  
  cols = floor( width / cellSize );
  rows = floor( height / cellSize );
    
  matrix = new Cell[cols][rows];
  
  for(int i = 0 ; i<rows ; i++){
    for(int j = 0 ; j<cols ; j++){
      matrix[j][i] = new Cell( new PVector( j * cellSize, i * cellSize ), cellSize);
    }
  }
  
  matrix[0][0].SetAsFirst();

  path = new PVector[ rows * cols ];
  
  path[0] = new PVector(0,0);
 
  pIndex = 0;
}

void Search(){
  //queries cell to know which directions already opened
  boolean[] isOpen = matrix[ int( path[ pIndex ].x )] [ int( path[ pIndex ].y ) ].Query();  

  //set boarder openings to used so the pointer doesn't travel outside the bounds of the maze
      if( int( path[ pIndex ].x ) < 1 ){
        isOpen[3] = true;
      }else if( int( path[ pIndex ].x ) > cols -2 ){
        isOpen[1] = true;
      }
      
      if( int( path[ pIndex ].y ) < 1 ){
        isOpen[0] = true;
      }else if( int( path[ pIndex ].y ) > rows -2 ){
        isOpen[2] = true;
      }
      
  //check if neighbour cells are open already
  if(int( path[ pIndex ].x -1 ) > -1){
    if(matrix[ int( path[ pIndex ].x -1 )] [ int( path[ pIndex ].y +0) ].QueryOpen()){
      isOpen[3] = true;
    }
  }
  
  if(int( path[ pIndex ].x +1 ) < cols){
    if(matrix[ int( path[ pIndex ].x +1 )] [ int( path[ pIndex ].y +0) ].QueryOpen()){
      isOpen[1] = true;
    }
  }
  
  if(int( path[ pIndex ].y -1 ) > -1){
    if(matrix[ int( path[ pIndex ].x +0 )] [ int( path[ pIndex ].y -1) ].QueryOpen()){
      isOpen[0] = true;
    }
  }
  
  if(int( path[ pIndex ].y +1 ) < rows){
    if(matrix[ int( path[ pIndex ].x +0 )] [ int( path[ pIndex ].y +1) ].QueryOpen()){
      isOpen[2] = true;
    }
  }
  
 
  //count the avaible openings that are not in use
  int n = 0;
  for(int i = 0 ; i < isOpen.length ; i++){
    if(isOpen[i]==false){
      n++;
    }
  }
  
  //create array with opens that are not in use
  int[] avaibleDir = new int[n];
  int counterA = 0;
  for(int i = 0 ; i < isOpen.length ; i++){
    if(isOpen[i]==false){
      avaibleDir[counterA] = i; 
      counterA++;  
    }
    
    //restarts maze
    if(pIndex==0 && n==0){
      Restart();
    }
  }
  
  //randomly sort the array of avaible openings that are not in use
    int[] avaibleDirSorted = new int[n];
  
  if(n!=0){
    
    for(int i = 0 ; i < avaibleDirSorted.length ; i++){
      avaibleDirSorted[i] = -1; //minus one means its avaible to be writen since indexes only work in most languages from zero up
    }
    
    for(int i = 0 ; i < avaibleDir.length ; i++){
      int j = floor(random(0,avaibleDir.length));
      while(true){
        /*
        println("");
        print(" | pIndex: "+ pIndex);
        print(" | avaibleDirSorted length: "+ avaibleDirSorted.length);
        print(" | j: "+ j);
        */
        if( avaibleDirSorted[j] == -1 ){
          avaibleDirSorted[j] = avaibleDir[i];
          break;
        }else{
          j++;
          if (j >= avaibleDirSorted.length)
          {
            j = 0;
          }
        }
      }
    }
  }
  /*
  println("");
  print(" | avaibleDirSorted: ");
  printArray(avaibleDirSorted);
  println("");
  print("x: " +int(path[ pIndex ].x));
  print(" | y: " +int(path[ pIndex ].y));
  */
  //set direction as the path to follow
  if(n!=0){
    matrix[ int( path[ pIndex ].x )] [ int( path[ pIndex ].y ) ].SetDirection(avaibleDirSorted[0]);
    
    switch(avaibleDirSorted[0]){
        case 0 : path[pIndex +1] = new PVector( int( path[ pIndex ].x )    , int( path[ pIndex ].y ) -1 ); break;
        case 1 : path[pIndex +1] = new PVector( int( path[ pIndex ].x +1 ) , int( path[ pIndex ].y ) );    break;
        case 2 : path[pIndex +1] = new PVector( int( path[ pIndex ].x )    , int( path[ pIndex ].y ) +1);  break;
        case 3 : path[pIndex +1] = new PVector( int( path[ pIndex ].x -1 ) , int( path[ pIndex ].y ) );    break;
    }
    
    pIndex++;
  }
    
  //set next cell to open direction to the one previous to it 
  if(n!=0){  
    switch(avaibleDirSorted[0]){
        case 0 : matrix[ int( path[ pIndex ].x )] [ int( path[ pIndex ].y ) ].SetDirection(2); break;
        case 1 : matrix[ int( path[ pIndex ].x )] [ int( path[ pIndex ].y ) ].SetDirection(3); break;
        case 2 : matrix[ int( path[ pIndex ].x )] [ int( path[ pIndex ].y ) ].SetDirection(0); break;
        case 3 : matrix[ int( path[ pIndex ].x )] [ int( path[ pIndex ].y ) ].SetDirection(1); break;
    }
  }
  
  
  //if there is no avaible direction then return to previous cell  
    if( n == 0  && pIndex!=0){
      pIndex--;
    }
  
}


void draw(){
  background(0);
  for(int i = 0 ; i<rows ; i++){
    for(int j = 0 ; j<cols ; j++){
     
      matrix[j][i].SetInactive();
    
      if( int( path[ pIndex ].x ) == j  && int( path[ pIndex ].y ) == i)
        matrix[j][i].SetActive();
      
      matrix[j][i].Show();
    
    }
  }
  
  Search();
}
