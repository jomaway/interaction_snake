class Vektor {
  int x;
  int y;
  
  public Vektor() {
    this.x = 0;
    this.y = 0;
  }
  
  public Vektor(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  
  public boolean equals(Vektor v) {
     if (this.x == v.x && this.y == v.y) {
       return true;
     } else { return false; }
  }
  
  
}