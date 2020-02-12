CBody Sun;


void setup(){
size(600,600);

Sun = new CBody( 0 , 0 , 30 , 5 , new PVector(0,0) );
}

void draw(){
background(0);
translate( width/2 , height/2 );
Sun.Show();

}
