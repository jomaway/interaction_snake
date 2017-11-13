class Food {
  private color farbe = color(229,76,76);
  public Vektor position;
  private Boolean eaten = false;
  
  public Food(int x, int y) {
    this.position = new Vektor(x,y);
  }
  
  public void display() {
    stroke(255);
    fill(farbe);
    rect(position.x*20, position.y*20, 20, 20);
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