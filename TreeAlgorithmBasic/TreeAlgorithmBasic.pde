
float[][] P1X;
float[][] P1Y;
float[][] P2X;
float[][] P2Y;

int convolutions;
int nodeDivision;
float initialLength;

boolean drawn;

  void setup(){
    size(600,600);
    background(0);
    
    drawn = false;
    
    convolutions = 6;
    nodeDivision = 3;
    initialLength = 100;    
   
       P1X = new float[convolutions][];
       P1Y = new float[convolutions][];
       P2X = new float[convolutions][];
       P2Y = new float[convolutions][];
       
      P1X[0] = new float[]{width/2}; 
      P1Y[0] = new float[]{height}; 
      P2X[0] = new float[]{width/2}; 
      P2Y[0] = new float[]{height-initialLength};
    
    for ( int i = 1 ; i< convolutions ; i++){
      int iConv;
      if(i == 0){
        iConv = 1;
      } else{
        iConv = i;
      }
  
    float[] P1XSubArray = new float[int(pow(nodeDivision,iConv))];
    float[] P1YSubArray = new float[int(pow(nodeDivision,iConv))];
    float[] P2XSubArray = new float[int(pow(nodeDivision,iConv))];
    float[] P2YSubArray = new float[int(pow(nodeDivision,iConv))];
      
     
      
      for(int j = 0 ; j<int(pow(nodeDivision,iConv)) ; j++){
       int n;
       if( i == 0 ){ n = 0; } else { n = 1; };
        print (floor(j/nodeDivision));
       P1XSubArray[j] = P2X[i-n][floor(j/nodeDivision)]; 
       P1YSubArray[j] = P2Y[i-n][floor(j/nodeDivision)];
       
       P2XSubArray[j] = (width/(pow(nodeDivision,iConv)+1))*(j+1);
       P2YSubArray[j] = height - (((iConv+1) * initialLength)-((initialLength*0.3)*(iConv+1)));   
         
      }
      
       P1X[i] = P1XSubArray; 
       P1Y[i] = P1YSubArray;
       P2X[i] = P2XSubArray;
       P2Y[i] = P2YSubArray;   
    }
  }
 
  void draw(){
    if(!drawn){
      background(0);
      stroke(255);
      for(int i = 0; i<convolutions; i++){
        for(int j = 0; j<P1X[i].length; j++){
          
          line(P1X[i][j], P1Y[i][j], P2X[i][j], P2Y[i][j]);
        }
      }
      drawn = true;
    }
  }
