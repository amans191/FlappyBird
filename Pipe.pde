class Pipe
{
  int xi;
  int pipeWidth;
  int gap;
  int yj;
  
  //constructor
  Pipe()
  {
    xi = width;
    pipeWidth = 50;
    gap = 100;
    yj = (int)random(0, 500);
  }
  
  void render()
  {
    
    
    stroke(255);
    fill(0 , 255, 0);
    rect(xi, xi + pipeWidth, pipeWidth, yj);
  }
  
  void update()
  {
    xi -= 5;
  }
}