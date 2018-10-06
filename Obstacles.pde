class Obstacles {
  //PFont helvetica;
  float angle = 0.0;
  float disX, disY, catX, catY, heartX, heartY, starX, starY;
  PImage disappoint;
  PImage heart;
  PImage cat;
  PImage star;

  Obstacles() {
    disX = -200;
    disY = height/2 + 50;
    catX = -200;
    catY = height/2 + 50;
    heartX = -200;
    heartY = height/2;
    starX = -200;
    starY = height/2;
    disappoint = loadImage("disappointed.png");
    heart = loadImage("heart.png");
    cat = loadImage("cat.png");
    star = loadImage("star.png");
  }

  void heartFun() {
    pushMatrix();
    fill(0);
    translate(heartX, heartY);
    imageMode(CENTER);
    rotate(-angle);
    // rectMode(CENTER);
    // rect(0, 0, 50, 50);
    image(heart, 0, 0);
    noFill();
    stroke(0);
    ellipse(5, 10, 10, 10);
    ellipse(10, 50, 5, 5);
    angle += 0.3;
    popMatrix();
  }

  void starFun() {
    pushMatrix();
    fill(0);
    translate(starX, starY);
    imageMode(CENTER);
    rotate(-angle);
    // rectMode(CENTER);
    // rect(0, 0, 50, 50);
    image(star, 0, 0);
    // noFill();
    // stroke(0);
    // ellipse(5, 10, 10, 10);
    // ellipse(10, 50, 5, 5);
    angle += 0.3;
    popMatrix();
  }

  void disappointFun() {
    pushMatrix();
    fill(0);
    imageMode(CENTER);
    translate(disX, disY);
    image(disappoint, 0, 0);
    popMatrix();
  }

  void catFun() {
    pushMatrix();
    fill(0);
    imageMode(CENTER);
    translate(catX, catY);
    image(cat, 0, 0);
    popMatrix();
  }

  void move() {
    disX -= 15;
    catX -= 15;
    starX -= 15;
    heartX -= 15;
    // wheelY = wheelY +10;
  }

  void reset() {
    disX = width;
    catX = width;
    starX = width;
    heartX = width;
  }
}
