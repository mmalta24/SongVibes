boolean lerping = true;

int linesX = 40; // number of lines in x direction
int linesY = 26; // number of lines in y direction

boolean repel = true;
boolean autopilot = false;
int coef = 1;
float magnitude = 0;
float maxMagnitude = 848.5281374;

color c;
PVector distance;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;

Node[][] Nodes = new Node[linesX][linesY]; // create matrix of Nodes

Fish jimmy = new Fish(); //create Jimmy

void setupGraph2() {
  colorMode(HSB, 255);
  stepsX = (width) / linesX;
  stepsY = (height) / linesY;
  // initialize nodes
  for (int i = 0; i < linesX; i++) {
    for (int j = 0; j < linesY; j++) {
      Nodes[i][j] = new Node((i+0.5)*stepsX, (j+0.5)*stepsY, 2);
    }
  }
  minim = new Minim(this);
  factor = float(width)/mySound.bufferSize();
}

void drawGraph2() {
  background(frameCount%255, 255, 30);
  coef = 1;
  
  if (lerping) {
    magnitude = lerp(sum, last_sum, 0.7)/2.5;
  } else {
    magnitude = last_sum;
  }
  wave = last_sum/2.5;
  // draw nodes
  for (int i = 0; i < linesX; i++) {
    for (int j = 0; j < linesY; j++) {
      if (autopilot) {
        jimmy.update();
        distance = new PVector(Nodes[i][j].xpos - jimmy.xpos, Nodes[i][j].ypos - jimmy.ypos);
      } else {
        distance = new PVector(Nodes[i][j].xpos - mouseX, Nodes[i][j].ypos - mouseY);
      }
      scale = (1/distance.mag())*magnitude;
      fill(255);
      intensity = pow(1 - distance.mag()/(maxMagnitude), 5) / 5;
      radius = (intensity*magnitude);
      Nodes[i][j].xpos += coef*(distance.x*scale)/25;
      Nodes[i][j].ypos += coef*(distance.y*scale)/25;
      Nodes[i][j].xpos = lerp(Nodes[i][j].xpos, Nodes[i][j].anchorx, 0.05);
      Nodes[i][j].ypos = lerp(Nodes[i][j].ypos, Nodes[i][j].anchory, 0.05);
      if (radius > 50) {
        radius = 50;
      }
      if (radius < 2) {
        radius = 2;
      }
      c = color(170 + magnitude/2, magnitude*5, 255, 255);
      fill(c);
      stroke(c);
      ellipse(Nodes[i][j].xpos + coef*(distance.x*scale), Nodes[i][j].ypos + coef*(distance.y*scale), radius, radius);
    }
  }
  // draw wave code
  c = color(170 + wave/2, wave*5, 255, 255);
  fill(c);
  stroke(c);
  strokeWeight(2);
  sum = 0; //increase sum based on amplitude of wave
  for (int i = 0; i < mySound.bufferSize() - 1; i++)
  {
      line(i*factor, height/2 + mySound.left.get(i)*last_sum + 2, i*factor+1, height/2 + mySound.left.get(i+1)*last_sum + 2);
      sum += abs(mySound.left.get(i));
  }
  last_sum = sum;
}
