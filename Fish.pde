class Fish {
  float xpos, ypos, speed;
  Fish () {
    ypos = random(800*0.25, 800*0.75);
    xpos = random(1000*0.25, 1000*0.75);
  }
  void update() {
    //increase movement w/ volume of song
    if (lerping) {
      xpos = lerp(xpos + random(sum/20) - sum/40, xpos, 0.5);
      ypos = lerp(ypos + random(sum/20) - sum/40, ypos, 0.5);
    } else {
      xpos = xpos + random(sum/20) - sum/40;
      ypos = ypos + random(sum/20) - sum/40;
    }
    if (ypos > height*0.75) {
      ypos = height*0.75;
    } else if (xpos > width*0.75) {
      xpos = width*0.75;
    } else if (xpos < width*0.25) {
      xpos = width*0.25;
    } else if (ypos < height*0.25) {
      ypos = height*0.25;
    }
  }
}
