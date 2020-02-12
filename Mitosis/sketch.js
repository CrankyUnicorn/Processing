var myCells = [];
var cellPopulation;

function setup() {
  createCanvas(400, 400);
  
  cellPopulation = 10;
  cellInitialRadius =10;
  
  for(let i=0; i<cellPopulation; i++){
    myCell = new Cell(random(cellInitialRadius,width-cellInitialRadius),random(cellInitialRadius,height-cellInitialRadius),cellInitialRadius,[random(125,255),random(125,255),random(125,255)],1);
    myCells.push(myCell);
  }
}

function draw() {
  background(60);
  
  for(let i=0;i<cellPopulation;i++){
    
    if(myCells[i].r>20){
       myCells.push(myCells[i].divide());
      cellPopulation++;
    }
    
    myCells[i].grow();
    myCells[i].move();
    myCells[i].show();
  }
}