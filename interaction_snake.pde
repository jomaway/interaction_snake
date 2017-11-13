import processing.net.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;

World world;

int count=0;
int speed = 10; //if lower it's faster.
boolean keactive;


void setup() {
  size(840, 480);  // 42*20 , 24*20 size of grid;
  frameRate(60);
  
  // create World
  world = new World();
  world.display();
  
  // setup osc for the controlls
  oscP5 = new OscP5(this,12000);
}

void draw() {
  if (count%speed == 0) {
    keactive = true;
    background(95);
    world.update();
    
    
  }
  count++;
  
   
  // do nothing for now
}

void keyPressed() {
  if (keactive) {
    keactive = false;
    if (keyCode == LEFT) {
      world.snake.moveLeft();
    } else if (keyCode == RIGHT) {
      world.snake.moveRight();
    }
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if(keactive){
    if(theOscMessage.addrPattern().equals("/move"))
    if (theOscMessage.get(0).stringValue().equals("left")) {
      world.snake.moveLeft();
    } else if (theOscMessage.get(0).stringValue().equals("right")) {
      world.snake.moveRight();
    }
  }
}