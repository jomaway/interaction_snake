class Food {
  private color farbe = color(229,76,76);
  public Vektor position;
  private Boolean eaten = false;
  
  public Food(int x, int y) {
    this.position = new Vektor(x,y);
  }
  
  public void display() {
    stroke(200);
    fill(farbe);
    rect(position.x*cellSize, position.y*cellSize, cellSize, cellSize);
  }
  
  public void generateNewPosition(int maxX, int maxY) {
    if (eaten) {
      position.x = (int) random(maxX);
      position.y = (int) random(maxY);
      eaten = false;
    }
    
  }
  
  public void eat() {
    this.eaten = true;
  }
  
}