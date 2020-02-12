PVector actualPos;
PVector previousPos;
PVector[] savedPos;

float bLength;
float bAngle;

float savedLength;
float savedAngle;

String composition;

Rule[] rules;


class Rule{
  char detect;
  String replace;
  
  Rule(char d , String r){
    detect = d;
    replace = r;
    
  }
  
  void UseRule(){
    RuleList(detect);
  }
  
  
}


void setup(){
  size( 600 , 600 );
  
  int compositionsPass = 3;
  
  rules = new Rule[5];
  rules[0] = new Rule('F',"FF-[+F-F-F]+[-F+F+F]");
  rules[1] = new Rule('+',"+");
  rules[2] = new Rule('-',"-");
  rules[3] = new Rule('[',"[");
  rules[4] = new Rule(']',"]");

  
  composition = "F";
  
  for(int i = 0 ; i<compositionsPass ; i++){
    composition = Compose(composition);
  }
  
  print(composition);
}


void RuleList(char d){
    switch(d){
      case 'F': 
        actualPos = PVector.add( previousPos , new PVector(cos(bAngle)*bLength , sin(bAngle)*bLength)); 
        line(previousPos.x,previousPos.y,actualPos.x,actualPos.y);
        previousPos = actualPos;
        actualPos = null;
        //bLength *= 0.999;
        break;
      case '+': 
        bAngle += PI/7; 
        break;
      case '-' :
        bAngle -= PI/7; 
        break;
      case '[':
        PVector[] tempPosA = new PVector[savedPos.length+1];
        for(int i = 0 ; i < savedPos.length; i++){
         tempPosA[i] = savedPos[i];
        }
        tempPosA[tempPosA.length-1] = previousPos;
        savedPos = tempPosA;
        break;
      case ']':
        previousPos = savedPos[savedPos.length-1];
        PVector[] tempPosB = new PVector[savedPos.length-1];
        for(int i = 0 ; i < savedPos.length-1; i++){
         tempPosB[i] = savedPos[i];
        }
        savedPos = tempPosB;
        break;
      default : 
        break;
    }
  }


String Compose ( String s){
  String newComposition = "";
  for(int i = 0 ; i< s.length() ; i++){  
     for(int j = 0 ; j < rules.length ; j++){
      if ( s.charAt(i) == rules[j].detect ){
        newComposition += rules[j].replace;
      }
    }
  }
  return newComposition;
}


void DrawTree(){
    
  savedPos = new PVector[0];
  
  bLength = 10;
  
  bAngle = -PI/2;
  savedAngle = 0;
  
  previousPos = new PVector(width/2 , height);
  
  background(0);
  noFill();
  stroke(255);
  
  for(int i = 0 ; i< composition.length() ; i++){  
    for(int j = 0 ; j < rules.length ; j++){
      if ( composition.charAt(i) == rules[j].detect ){
        rules[j].UseRule();
      }
    }
  }
}



void draw(){
  DrawTree();
}
