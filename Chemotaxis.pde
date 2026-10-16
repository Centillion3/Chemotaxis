class Bacteria {
  private int x;
  private int y;
  private int r;
  private color c;

  Bacteria(int x, int y, int r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }

  void move() {
    if(Math.random() < 0.6){
      if(x < playerX){
        x++;
      }
      else if(x > playerX){
        x--;
      }
      
      if(y < playerY){
        y++;
      }
      else if(y > playerY){
        y--;
      }
    }
    else{
      x += (int)(Math.random() * 4) - 1;
      y += (int)(Math.random() * 4) - 1;
    }
  }

  boolean checkDist(int otherX, int otherY, int otherR) {
    return dist(x, y, otherX, otherY) <= r + otherR;
  }

  void show() {
    fill(c);
    ellipse(x, y, r * 2, r * 2);
    move();
  }
}

Bacteria[] blobs = new Bacteria[50];
int playerX = 100;
int playerY = 100;
int playerRadius = 15;
int playerSpeed = 30;
boolean gameOver = false;

void setup() {
  size(800, 800);
  for(int i = 0; i < blobs.length; i++){
    int x = (int)(Math.random() * 100) + 350;
    int y = (int)(Math.random() * 100) + 350;
    int r = 5;
    color c = color(
      (int)(Math.random() * 256),
      (int)(Math.random() * 256),
      (int)(Math.random() * 256)
    );
    blobs[i] = new Bacteria(x, y, r, c);
  }
}

void draw() {
  background(255);

  if (gameOver) {
    fill(255, 0, 0);
    textSize(50);
    textAlign(200, 200);
    text("womp womp", 800 / 2, 800 / 2);
    return;
  }

  for (int i = 0; i < blobs.length; i++) {
    blobs[i].move();
    blobs[i].show();

    if (blobs[i].checkDist(playerX, playerY, playerRadius)) {
      gameOver = true;
      break;
    }
  }

  fill(0, 100, 255);
  ellipse(playerX, playerY, playerRadius * 2, playerRadius * 2);
}
void keyPressed(){
  if(key == 'w'){
    playerY -= playerSpeed;
  }
  if(key == 's'){
    playerY += playerSpeed;
  }
  if(key == 'a'){
    playerX -= playerSpeed;
  }
  if(key == 'd'){
    playerX += playerSpeed;
  }
}
