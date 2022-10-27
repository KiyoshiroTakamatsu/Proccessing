int c=0;
int swi=0;
BoundBall ball;
Bar bar;

void setup(){
  size(700, 700);
  ball = new BoundBall(100, 100, 100);
  bar = new Bar(0, 650, 100);
  textAlign(CENTER);
}
void draw(){
  switch(swi){
    case 0:
      gameStart();
      break;
    case 1:
      gamePlay();
      boundCounter();
      break;
    case 2:
      gameOver();
      break;
  }
}
void gameStart(){
  background(255);
  fill(255, 0, 0);
  strokeWeight(5);
  ellipse(100, 80, 100, 100);
  fill(0);
  stroke(0);
  strokeWeight(5);
  line(100, 650, 200, 650);
  textSize(100);
  fill(100);
  text("Bound Game", width/2, height/4);
  textSize(50);
  fill(0);
  text("Press 's' key to start!", width/2, height/4*3);
  if(key == 's'){
    swi = 1;
  }
}
void gamePlay(){
  background(255);
  ball.proBall();
  bar.proBar();
}
void gameOver(){
  background(0);
  fill(255, 0, 0);
  textSize(100);
  text("Game Over", width/2, height/2);
  fill(255);
  textSize(30);
  text("If you want to try, Press 'Enter'!", width/2, height/4*3);
  if(key == ENTER){
    ball=new BoundBall(100, 100, 100);
    bar = new Bar(0, 650, 100);
    swi = 1;
    c=0;
  }
}
void boundCounter(){
  if(c%10==0){
    fill(255, 0, 0);
    textSize(77);
    text(c + "combo", width/2, height/4);
  } else {
    textSize(40);
    fill(0);
    text(c + "combo", width/2, height/4);
  }
}
public class BoundBall{
  private float bX, bY, distance;
  private int speedX = 7;
  private int speedY = -5;
  public BoundBall(float bX, float bY, float distance){
    this.bX = bX;
    this.bY = bY;
    this.distance = distance;
  }
  public void proBall(){
    fill(255,0,0);
    stroke(0);
    strokeWeight(5);
    ellipse(this.bX, this.bY, this.distance, this.distance);
    if(this.bX + this.distance/2>width || this.bX - this.distance/2<0){
      this.speedX = -this.speedX;
    }
    if(this.bY - this.distance/2<0){
      this.speedY = -this.speedY;
    }
    if(this.bX > bar.getX1() && this.bX < bar.getX2() && this.bY + this.distance/2 > bar.getY1() && this.bY+this.distance/2 < 670){//バーにボールが当たった時
      this.speedY = -this.speedY;
      c += 1;
    }
    if(this.bY>height){
      swi = 2;
    }
    this.bX += this.speedX;
    this.bY += this.speedY;
  }
}
public class Bar{
  private float x1, y1, x2;
  public Bar(float x1, float y1, float x2){
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
  }
  public void proBar(){
    line(this.x1, this.y1, this.x2, this.y1);
    stroke(0);
    strokeWeight(4);
    if(clickChecker() == true && this.x2 < width){
      this.x1 += 10;
      this.x2 += 10;
    }
    if(clickChecker() == false && this.x1 > 0){
      this.x1 -= 10;
      this.x2 -= 10;
    }
  }
  public float getX1(){
    return this.x1;
  }
  public float getY1(){
    return this.y1;
  }
  public float getX2(){
    return this.x2;
  }
}
boolean clickChecker(){
  if(mousePressed){
    return true;
  }
  return false;
}
