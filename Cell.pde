// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  private int x,y;   // x,y location
  private int size = cellSize;   // width and height

  // Cell Constructor
  Cell(int x, int y) {
    this.x = x;
    this.y = y;
  } 

  public void display() {
    stroke(95);
    //fill(80,120,40); // green color
    fill(95); // grey color
    rect(x*size,y*size,size,size);
  }
  
  public void display(color farbe) {
    stroke(255);
    fill(farbe);
    rect(x*size,y*size,size,size);
  }
}