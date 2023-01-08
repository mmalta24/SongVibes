void keyPressed() {
  switch(key) {
  case 'c':
    figure="cube";
    break;
  case 's':
    figure="sphere";
    break;
  case 'x':
    if (!rX) {
      rX=true;
    } else {
      rX=false;
    }
    break;
  case 'y':
    if (!rY) {
      rY=true;
    } else {
      rY=false;
    }
    break;
  case 'z':
    if (!rZ) {
      rZ=true;
    } else {
      rZ=false;
    }
    break;
  case '+':
    speed3+=0.01;
    break;
  case '-':
    if (speed==0.01) {
      speed3=0.01;
    } else {
      speed3-=0.01;
    }
    break;
  case 'a':
    autopilot = !autopilot;
    break;
  case 'i':
    saveFrame("wavepttrn-####.jpg");
    break;
  case '1':
    graph=1;
    break;
  case '2':
    graph=2;
    break;
  case '3':
    graph=3;
    break;
  case 'm':
    manual=true;
    break;
  }
}
