import processing.net.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;

World world;

int count=0;
int speed = 5; //if lower it's faster.
boolean keactive;

void setup() {
  size(1680, 960);  // 42*20 , 24*20 size of grid;
  smooth(4);
  frameRate(30);
  
  // setup osc for the controlls
  oscP5 = new OscP5(this,12000);
  
  // create World
  world = new World(oscP5);
  
}

void doExit()
{
  println("In stop");
  OscMessage msg = new OscMessage("/gamestatus");
  msg.add("exit");
  oscP5.send(msg, new NetAddress("127.0.0.1",12001));
}

void draw() {
  if (count%speed == 0) {
    keactive = true;
    world.update();
  }
  count++;
}

void keyPressed() {
  if (keactive) {
    keactive = false;
    if (keyCode == LEFT) {
      world.snake.moveLeft();
    } else if (keyCode == RIGHT) {
      world.snake.moveRight();
    } else if (key == BACKSPACE) {
      world.restart();
    } else if (key == ESC){
       doExit(); 
    }
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if(keactive){
    if(theOscMessage.addrPattern().equals("/move")) {
      if (theOscMessage.get(0).stringValue().equals("left")) {
        world.snake.moveLeft();
      } else if (theOscMessage.get(0).stringValue().equals("right")) {
        world.snake.moveRight();
      } else if (theOscMessage.get(0).stringValue().equals("restart")) {
        world.restart(); 
      }
    } else if (theOscMessage.addrPattern().equals("restart")) {
      world.restart();
    }
  }
}