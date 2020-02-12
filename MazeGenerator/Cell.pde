class Cell{

  private PVector pos;
  private float size;
  private boolean[] isOpen = new boolean[4];
  private boolean open = false;
  private boolean isActive = false;
  
    Cell(PVector _pos, float _size){
      
      pos = _pos;
      size = _size;
      
      for(int i = 0 ; i<isOpen.length;i++){
        isOpen[i] = false;
      }
     
    }
    
    public void SetAsFirst(){
      isOpen[0] = true;
      isActive = true;
    }
    
    
    public boolean[] Query(){
      boolean[] booleanArray = new boolean[isOpen.length];
      for(int i = 0 ; i<isOpen.length ; i++){
        booleanArray[i] = isOpen[i];
      }
      return booleanArray;
    }
    
    public boolean QueryOpen(){
      return open;
    }
    
    
    public void SetDirection(int _dirIndex){
      isOpen[_dirIndex] = true;
    }
    
     public void SetInactive(){
      isActive = false;
    }
    
    public void SetActive(){
      isActive = true;
    }
    
    public void Show(){
      
      noStroke();
      
      if(!open){
        for(int i = 0 ; i<isOpen.length;i++){
          if(isOpen[i] == true)
            open=true;
        }
      }
      
      if(!open){
        fill(0);
      } else if (isActive)   {
        fill(200,200,50);
      } else {
        fill(c);
      }
    
      rect( pos.x , pos.y , size , size );
 
      stroke(255);
      
      //up
      if(isOpen[0] == false)
      line(pos.x , pos.y, pos.x+size, pos.y);
      //right
      if(isOpen[1] == false)
      line(pos.x+size , pos.y, pos.x+size, pos.y+size);
      //down
      if(isOpen[2] == false)
      line(pos.x , pos.y+size, pos.x+size, pos.y+size);
      //left
      if(isOpen[3] == false)
      line(pos.x , pos.y, pos.x, pos.y+size);
      
    }

}
