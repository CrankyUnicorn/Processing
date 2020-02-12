float[] tree;
boolean drawn;

int treeLevels;
int treeDivisions;

int indexN;

float branchLength;

float dTime;

//START
void setup(){
  frameRate(30);
  fullScreen();
  //size(600,600);
  background(0);
  drawn = false;
  
  treeLevels = 10;
  treeDivisions = 2;
  branchLength = 200/treeLevels;
  
  indexN = 0;
  
  dTime = 0;
  
  int totalPoints = 4;
  for(int i = 0 ; i<treeLevels+1 ; i++){
    totalPoints += int(pow(treeDivisions,i))*4;
  }

  print(totalPoints + " | ");
   
  tree = new float[totalPoints];
}

// 
void MakeBranchStatic(int recursion, float parentX, float parentY, float angle){
  
  float thisX = parentX + cos(angle)*(branchLength*recursion);
  float thisY = parentY + sin(angle)*(branchLength*recursion);
  
  //println(" | x: "+parentX+" y: "+parentY);
  
    tree[indexN++] = parentX;
    tree[indexN++] = parentY;
    tree[indexN++] = thisX;
    tree[indexN++] = thisY;
  
  if(recursion>0){
    for(int i = 0 ; i < treeDivisions ; i++){
      float apertureAngle = (PI/36*sq(recursion));
      float nextAngle = angle - apertureAngle / 2 + ( apertureAngle / (treeDivisions - 1) ) * i;
      //println(" | i: "+i+" -> "+nextAngle); 
      MakeBranchStatic(recursion-1, thisX , thisY , nextAngle );
    }
  }
}

// 
void MakeBranchDynamic(int recursion, float parentX, float parentY, float angle){
  
  float thisX = parentX + cos(angle)*(branchLength*recursion);
  float thisY = parentY + sin(angle)*(branchLength*recursion);
  
  //println(" | x: "+parentX+" y: "+parentY);
  
    tree[indexN++] = parentX;
    tree[indexN++] = parentY;
    tree[indexN++] = thisX;
    tree[indexN++] = thisY;
  
  if(recursion>0){
    for(int i = 0 ; i < treeDivisions ; i++){
      float apertureAngle = (PI/4*(pow(treeDivisions,treeLevels-recursion)+noise(dTime)*recursion)*sq(recursion));
      float nextAngle = angle - apertureAngle / 2 + ( apertureAngle / (treeDivisions - 1) ) * i;
      //println(" | i: "+i+" -> "+nextAngle); 
      MakeBranchDynamic(recursion-1, thisX , thisY , nextAngle );
    }
  }
}


void ShowStatic(){
    if(!drawn){
    drawn = true;
  //I don't know why but increment does not work in array as I expected
  //it come out before the opperation increment is finished
    tree[indexN++] = width / 2;
    tree[indexN++] = height;
    tree[indexN++] = width / 2;
    tree[indexN++] = height;
    
    //Recursion Part
    //println(" | x: "+tree[0]+" y: "+tree[1]);
    MakeBranchStatic(treeLevels , tree[2] , tree[3], -PI/2);

    //
    stroke(255);
    noFill();
    
    for(int i = 0 ; i<tree.length-4 ; i+=4){
     line(tree[i],tree[i+1],tree[i+2],tree[i+3]);
    }
    
    for(int i = 0 ; i<tree.length-2 ; i+=2){
      ellipse(tree[i],tree[i+1],2,2);
    }
    print(indexN);
   //line( 300 , 300, 300+cos(PI/2)*100 , 300+sin(PI/2)*100);
  }

}

void ShowDynamic(){
  
   background(0);
   
  //I don't know why but increment does not work in array as I expected
  //it come out before the opperation increment is finished
    tree[indexN++] = width / 2;
    tree[indexN++] = height;
    tree[indexN++] = width / 2;
    tree[indexN++] = height-branchLength*4;
    
    //Recursion Part
    //println(" | x: "+tree[0]+" y: "+tree[1]);
    MakeBranchDynamic(treeLevels , tree[2] , tree[3], -PI/(1.95+((noise(dTime)/10))));

    //
    stroke(255);
    noFill();
    
    for(int i = 0 ; i<tree.length-4 ; i+=4){
     line(tree[i],tree[i+1],tree[i+2],tree[i+3]);
    }
    
    for(int i = 0 ; i<tree.length-2 ; i+=2){
      ellipse(tree[i],tree[i+1],2,2);
    }
    
    //print(indexN);
   
  indexN = 0;

}

//UPDATE
void draw(){
    
  
  //ShowStatic();
  //print(" | " + noise(dTime));
  dTime += 1.0/1200;
  ShowDynamic();
}
