import java.util.List;
import java.util.LinkedList;

class Snake {
  private Boolean dead = false;
  private color farbe = color(76,97,227);
  //private MovementDirection direction = MovementDirection.STOP;
  private Vektor direction = new Vektor(1,0);
  
  public Vektor head = new Vektor(10,6);
  private LinkedList<Vektor> tail = new LinkedList<Vektor>();
  // length is tail.size();
  
  public Snake() {
      tail.add(head);
  }
  
  public void eat() {
    // TODO: add one to tail
    Vektor last;
    if (!tail.isEmpty()) {
      last = tail.get(tail.size() - 1);
    } else {
      last = head;
    }
    tail.add(new Vektor(last.x-direction.x,last.y-direction.y));
  }
  
  public void update() {
    tail.addFirst(head);
    tail.removeLast();
    head = new Vektor(head.x+direction.x,head.y+direction.y);
    
    
    // check if head touches body
    for (Vektor p : tail) {
      if (head.equals(p)) {
        this.dead = true;
      }
    }
    // check if out of bound 
    if (head.x < 0 || head.x > 42 || head.y < 0 || head.y > 24 ) {
      this.dead = true;
    }
      
    this.display();
  } // update
  
  public void display() {
    stroke(255);
    fill(farbe);
    rect(head.x*20,head.y*20,20,20);
    
    for(Vektor p: tail) {
      rect(p.x*20,p.y*20,20,20);
    }
  }
  
  public boolean isAlive() {
   return !this.dead; 
  }
  
  private Vektor[] DirectionArray = {
      new Vektor(0,1),
      new Vektor(1,0),
      new Vektor(0,-1),
      new Vektor(-1,0)
    };
  
  public void moveRight() {
    for(int i=0; i<4; i++) {
       if( this.direction.equals(DirectionArray[i]) ) {
          int n = (i+3)%4;
          this.direction = DirectionArray[n];
          break;
       }
    }
  }
  
  public void moveLeft() {
    for(int i=0; i<4; i++) {
       if( this.direction.equals(DirectionArray[i]) ) {
          int n = (i+1)%4;
          this.direction = DirectionArray[n];
          break;
       }
    }
  }
}