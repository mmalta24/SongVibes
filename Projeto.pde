//bibliotecas
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import peasy.*;
PeasyCam cam;

AudioPlayer mySound;

Minim minim;
BeatDetect beat;

float graph=1;

void setup (){
  size(1024,768,P3D);
  minim=new Minim(this);
  beat =new BeatDetect();
  beat.setSensitivity(400); 
  mySound = minim.loadFile("data/MEDUZA   Paradise ft Dermot Kennedy.mp3");    
  mySound.play();
  
  setupGraph1();
  setupGraph2();
  setupGraph3();
  noCursor();
}

void draw(){
  if(graph==1){
    drawGraph1();
  }
  else if(graph==2){
     drawGraph2();
  }
  else{
    drawGraph3();
  }
  
 
  
}
