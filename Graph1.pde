//variaveis
//estrela
float speed;
boolean manual=false;

//frequencia sonora
int  r = 200;
float rad = 70;

Star[] stars=new Star[300];

void setupGraph1(){
  
  //cam=new PeasyCam(this,500);
  
  for (int i=0; i<stars.length; i++){
    stars[i]=new Star();
  }
}

void drawGraph1(){
  // beat branca
  beat.detect(mySound.mix);
  //cam.beginHUD();
  background(0);
  
  //circulo
  PVector[] points=new PVector[128];
  
  for(int i=0; i<points.length;i++){
    float a=map(i,0,points.length-1,0,TWO_PI);
    points[i]= new PVector(width/2+cos(a)*(200+mySound.mix.get(i)*200),height/2+sin(a)*(200+mySound.mix.get(i)*200));
  }
  
  for(int i=0; i<points.length;i++){
    for(int j=0;j<points.length;j++){
      if(points[i].dist(points[j])<100){
        stroke(255,25);
        line(points[i].x,points[i].y,points[j].x,points[j].y);
      }
    }
  }
  pushMatrix();
  translate(width/2,height/2);
  
  if(beat.isOnset()) {
    background(255);
    speed=0;
  }
  else{
    if(manual==false){
      speed=25;
    }
    else{
      speed= map(mouseX,0,width,0,50);
      print(speed);
    }
    
  }
  
  //estrelas
  
   for (int i=0; i<stars.length; i++){
    stars[i].update();
    stars[i].show();
   }
   popMatrix();
   
  
   //cam.endHUD();
  
}
