class World {
  private int columns = 42;
  private int rows = 24;
  public Snake snake;
  private Food food;
  private Cell[][] grid = new Cell[columns][rows];
  
  private int count=0;
  
  public World() {
    snake = new Snake();
    food = new Food((int)random(columns),(int)random(rows));
    
    // initialise the grid 
    for(int c=0; c<columns; c++) {
      for(int r=0;r<rows;r++) {
         grid[c][r] = new Cell(c,r);
      }
    }
  } // constructor
  
  public void update() {
    if (snake.isAlive()){
      background(95);
      //display();
      snake.update();
      if (snake.head.equals(food.position) ) {
         snake.eat();
         food.eat();
         food.generateNewPosition(columns, rows);
      }
      food.display();
      count++;
    } else { displayLost(); }
  }
  
  public void display() {
    for(int c=0; c<columns; c++) {
      for(int r=0;r<rows;r++) {
        grid[c][r].display();
      }
    }
  }
  
  public void displayLost() {
    int x = 9;
    int y = 9;
    color lostcolor = color(250,33,236);
    for (y= 9;y<16;y++) {
      grid[x][y].display(lostcolor);
      grid[x+6][y].display(lostcolor);
      grid[x+10][y].display(lostcolor);
      grid[x+21][y].display(lostcolor);
    }
    y--;
    for (x=9;x<13;x++) {
      grid[x][y].display(lostcolor);
      grid[x+6][y].display(lostcolor);
      grid[x+6][y-6].display(lostcolor);
      grid[x+13][y].display(lostcolor);
      grid[x+13][y-3].display(lostcolor);
      grid[x+13][y-6].display(lostcolor);
      grid[x+19][y-6].display(lostcolor);
    }
    x=9;
    grid[x+13][y-5].display(lostcolor);
    grid[x+13][y-4].display(lostcolor);
    grid[x+16][y-2].display(lostcolor);
    grid[x+16][y-1].display(lostcolor);
    
    grid[x+23][y-6].display(lostcolor);
  }
}