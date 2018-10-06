Boolean checkStart;
Boolean checkLose;
Boolean checkWin;
int startTimer;
int stopTimer;
int gameState;

Obstacles disappoint;
Obstacles heart;
Obstacles cat;
Obstacles star;

Runaway player;

float bgX = 0;
int point = 0;

PImage space;
PImage star1;
PImage heart1;

void setup() {
  size(600, 400);
  smooth();
  frameRate(20);
  // obstacles
  disappoint = new Obstacles();
  heart = new Obstacles();
  cat = new Obstacles();
  star = new Obstacles();
  // player
  player = new Runaway();

  gameState = 0;
  checkLose = false;
  checkWin = false;
  checkStart = false;

  //startTimer = millis();
  space = loadImage("space.png");
  star1 = loadImage("star1.png");
  heart1 = loadImage("heart.png");
}

void draw() {

  background(255);

  bgDraw(); 
  bgMove();
  groundDraw();

  if (checkStart == false) {
    startPage();
  } else {
    //if (gameState == 0) {
    if (checkLose == false && checkWin == false) { 
      initializeGame();
    } else if (checkLose == true) {
      if (!mousePressed) {
        lost();
        playAgain();
      } else { 
        disappoint.reset();
        cat.reset();
        star.reset();
        heart.reset();
        initializeGame();
        point = 0;
      }
      //println(checkStart);
      //gameState = 0;
    } else if (checkWin == true) {
      won();
      //gameState++;
    }
    // //} else if (gameState == 1) {
    //   if (checkLose == false && checkWin == false) { 
    //     play();
    //   } else if (checkLose == true) {
    //     lost();
    //     playAgain();
    //     //gameState = 0;
    //   } else if (checkWin == true) {
    //     won();
    //     //gameState++;
    //   }
    //}
  }

  checkLoseFun();
  checkPointFun();
  checkWinFun();

  scoreBoard();
}



void bgDraw() {
  float angle = 0.05;

  if (bgX <= -100) {
    bgX = 0;
  }
  for (int j = -200; j < height; j += 10) {
    for (int i = -100; i < width + 200; i += 12) {
      //shapeMode(CENTER);
      pushMatrix();
      stroke(50);
      strokeWeight(1);

      //rotate(angle);
      line(i - bgX, j, i - bgX, j+5);
      popMatrix();
    }
    //    angle *= -1;
  }
}

void bgMove() {
  bgX = bgX - 9;
}

void groundDraw() {
  fill(0);
  rectMode(CORNER);
  noStroke();
  rect(0, height - 105, width, 250);
}

void startPage() {
  if (checkStart == false) {
    textSize(20);
    text("Click to start", width/2, height/2 - 60);
    textSize(14);
    text("Press", width/2, height/2); 
    image(space, width/2 + 40, height/2 - 4);
    text("to jump", width/2 + 90, height/2);
    text("Earn points by touching", width/2, height/2 + 30);
    star1.resize(18, 18);
    image(star1, width/2 + 152, height/2 + 15);
    heart1.resize(18, 18);
    image(heart1, width/2 + 175, height/2 + 17);
  }
}

void play() {
  if (keyPressed) {
    player.jumpFun();
  } else {

    if (frameCount%2 == 0) {
      player.display2();
    } else if (frameCount%2 != 0) {
      player.display1();
    }
  }

  // obstacles
  disappoint.disappointFun();
  disappoint.move(); 
  heart.move();
  heart.heartFun();
  cat.move();
  cat.catFun();
  star.move();
  star.starFun();

  // obstacles loop
  if (frameCount%40 == 0) {
    disappoint.reset();
  } else if (frameCount%65 == 0) {
    heart.reset();
  } else if (frameCount%75 == 0) {
    star.reset();
  } else if (frameCount%90 == 0) {
    cat.reset();
  }
}

void initializeGame() {
  checkStart = true;
  checkLose = false;
  checkWin = false;
  //point = 0;
  // disappoint.reset();
  // cat.reset();
  // star.reset();
  // heart.reset();
  play();
}

void checkLoseFun() {
  if (dist(disappoint.disX, disappoint.disY, player.runX, player.runY) <= 50) {
    checkLose = true;
    // println("OH NO!");
  }
  if (dist(cat.catX, cat.catY, player.runX, player.runY) <= 50) {
    checkLose = true;
    //println("OH NO!");
  }
}

void checkPointFun() {
  if (dist(star.starX, star.starY, player.runX, player.runY) <= 50) {
    point++;
  }
  if (dist(heart.heartX, heart.heartY, player.runX, player.runY) <= 50) {
    point++;
  }
}

void checkWinFun() {
  stopTimer = millis();
  if (stopTimer - startTimer >= 16000) {
    checkWin = true;
  }
}

void lost() {
  player.loseFun(); 
  textSize(20);
  text("BOO HOO HOO ~~ You lost", width/2 - 120, height/2);
}

void won() {
  frameRate(5);
  player.winFun();
  textSize(20);
  text("YAY ~~ You win!", width/2 - 80, height/2-50);
}

void playAgain() {
  // fill(0);
  // rect(245, 100, 120, 30);
  // fill(255);
  textSize(16);
  textMode(CENTER);
  text("Click to play again", 230, 120);
  text(point, 140, 140);
}

void scoreBoard() {
  fill(0);
  rect(100, 100, 90, 50);
  fill(255);
  textSize(16);
  textMode(CENTER);
  text("SCORE", 120, 120);
  text(point, 140, 140);
}

void mousePressed() {
  checkStart = true;
  startTimer = millis();
  redraw();
}
