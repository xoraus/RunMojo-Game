class Runaway {
  PImage run1;
  PImage run2;
  PImage jump;
  PImage lose;
  PImage win1;
  PImage win2;
  float runX, runY;

  Runaway() {
    run1 = loadImage("runaway1.png");
    run2 = loadImage("runaway2.png");
    jump = loadImage("jump.png");
    lose = loadImage("loser.png");
    win1 = loadImage("winner3.png");
    win2 = loadImage("winner2.png");
    runX = width/2;
    runY = height/2 +60;
    // jumpX = width/2;
    // jumpY = height/2 +50;
  }

  void display1() {
    imageMode(CENTER);
    runY = height/2 + 60;
    image(run1, runX, runY);
  }
  void display2() {
    imageMode(CENTER);
    runY = height/2 +60;
    image(run2, runX, runY);
  }
  void jumpFun() {
    imageMode(CENTER);
    runY = height/2-30;
    image(jump, runX, runY);
  }
  void loseFun() {
    imageMode(CENTER);
    runX = width/2;
    runY = height/2 + 60;
    image(lose, runX, runY);
  }
  void winFun() {
    imageMode(CENTER);
    runX = width/2;
    runY = height/2 + 60;

    if (frameCount%2 == 0) {
      image(win1, runX, runY);
    } else if (frameCount%2 != 0) {
      image(win2, runX, runY-50);
    }
  }
}
