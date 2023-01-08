color backgroundC=#ffffff, colorC=#000000, colorS=#ffffff, colorT=#ffffff;

String figure="cube";

boolean rX=false,rY=false,rZ=false;

float rotX=0,rotY=0.5,rotZ=0,speed3=0.05;

int cols,rows;
int slc=20;
int w=1200;
int h=900;
float flying=0;

float [][] terrain;

void setupGraph3(){
    cols=w/slc;
    rows=h/slc;
    terrain=new float[cols][rows];
}

void drawGraph3(){
  beat.detect(mySound.mix);
  background(backgroundC);
    flying-=0.01;
    float yoff=flying;
    for (int y=0; y<rows; y++){
      float xoff=0;
      for (int x=0; x<cols; x++){
        terrain[x][y]=map(noise(xoff,yoff),0,1,-mySound.mix.level()*350,mySound.mix.level()*350);
        xoff+=0.2;
      }
      yoff+=0.2;
    }
    stroke(colorT);
    noFill();
    pushMatrix();
    translate(width/2,height/2);
    rotateX(0);
    
    translate(-w/2,-h/2);
    for (int y=0; y<rows-1; y++){
      beginShape(TRIANGLE_STRIP);
      for (int x=0; x<cols; x++){
        vertex(x*slc,y*slc,terrain[x][y]);
        vertex(x*slc,(y+1)*slc,terrain[x][y+1]);
      }
      endShape();
    }
    popMatrix();
  
  if(beat.isOnset()){
    if(backgroundC==#ffffff){
      backgroundC=#000000;
      colorC=#ffffff;
       colorS=#000000;
      colorT=#ffffff;
    }
    else{
      backgroundC=#ffffff;
      colorC=#000000;
      colorS=#ffffff;
      colorT=#000000;
    }
  }
  
  if(rX==true){
    rotX+=speed3;
  }
  if(rY==true){
    rotY+=speed3;
  }
  if(rZ==true){
    rotZ+=speed3;
  }
  
  translate(width/2, height/2, 0);
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
 
  fill(colorC);
  if(figure=="cube"){
     strokeWeight(2);
     stroke(colorS);
     box(200+mySound.mix.level()*300);
  }
  else{
    noStroke();
    
    directionalLight(102, 102, 102, 0, 0, -1);
    lightSpecular(204, 204, 204);
    directionalLight(102, 102, 102, 0, 1, -1);
    sphere(200+mySound.mix.level()*400);
  }
  
  
}
