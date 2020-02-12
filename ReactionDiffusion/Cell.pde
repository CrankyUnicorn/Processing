class Cell{
  float dt;

  float dA;
  float dB;
  
  float f;
  float k;
  
  float a;
  float b;
  
  float calcA;
  float calcB;

  Cell(float _a , float _b){
   a = _a;
   b = _b;
   dt =   1;
   dA = 1.0;
   dB = 0.5;
   f = 0.055;
   k = 0.062;
   calcA = a;
   calcB = b;
  }
  
  void RefreshValues(){
    a = calcA;
    b = calcB;
  }
  
  void Calculate(){
    calcA = a + ( dA * (calcA) -a*b*b +f*(1-a) ) * dt;
    calcB = b + ( dB * (calcB) +a*b*b -(k+f)*b ) * dt;
  }
 
  //acessors
  float GetCalcA(){
    return calcA;
  }
  
  float GetA(){
    return a;
  }
  
  void SendA(float _a){
    calcA = _a;
  }
  
  float GetCalcB(){
    return calcB;
  }
  
  float GetB(){
    return b;
  }
  
  void SendB(float _b){
    calcB = _b;
  }

}
